#!/usr/bin/env python3
"""
Web service for C4 DSL generation.

This FastAPI application provides HTTP endpoints for generating and
downloading Structurizr DSL from LeanIX data.

Endpoints:
    GET /                   - HTML page with download button
    GET /api/dsl/stream     - Stream DSL for curl download
    GET /api/dsl/download   - Trigger browser download
    GET /health             - Health check endpoint
"""

from fastapi import FastAPI, Response, Query
from fastapi.responses import HTMLResponse, PlainTextResponse
from service.generator import DSLGeneratorService
import logging
from datetime import datetime

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Create FastAPI app
app = FastAPI(
    title="C4 DSL Generator",
    description="Generate Structurizr DSL from LeanIX data",
    version="1.0.0"
)


@app.get("/", response_class=HTMLResponse)
async def root():
    """
    Serve the main HTML page with a download button.
    """
    html_content = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>C4 DSL Generator</title>
        <style>
            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
                max-width: 800px;
                margin: 0 auto;
                padding: 40px 20px;
                background-color: #f5f5f5;
            }
            .container {
                background-color: white;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            h1 {
                color: #333;
                margin-bottom: 10px;
            }
            .subtitle {
                color: #666;
                margin-bottom: 30px;
                font-size: 16px;
            }
            .download-button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 15px 30px;
                font-size: 18px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                text-decoration: none;
                display: inline-block;
            }
            .download-button:hover {
                background-color: #0056b3;
            }
            .info {
                margin-top: 30px;
                padding: 20px;
                background-color: #f8f9fa;
                border-left: 4px solid #007bff;
                border-radius: 4px;
            }
            .info h2 {
                margin-top: 0;
                color: #333;
                font-size: 18px;
            }
            .info code {
                background-color: #e9ecef;
                padding: 2px 6px;
                border-radius: 3px;
                font-family: 'Courier New', monospace;
            }
            .info pre {
                background-color: #2d2d2d;
                color: #f8f8f2;
                padding: 15px;
                border-radius: 4px;
                overflow-x: auto;
            }
            .status {
                margin-top: 15px;
                padding: 10px;
                border-radius: 4px;
                display: none;
            }
            .status.loading {
                background-color: #fff3cd;
                color: #856404;
                display: block;
            }
            .status.success {
                background-color: #d4edda;
                color: #155724;
                display: block;
            }
            .status.error {
                background-color: #f8d7da;
                color: #721c24;
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>C4 DSL Generator</h1>
            <p class="subtitle">Generate Structurizr DSL from LeanIX data</p>

            <button class="download-button" onclick="downloadDSL()">
                Download Workspace DSL
            </button>

            <div id="status" class="status"></div>

            <div class="info">
                <h2>API Usage</h2>
                <p>You can also download the DSL using curl:</p>
                <pre>curl <span id="base-url"></span>/api/dsl/stream > c4-core-workspace.dsl</pre>

                <p>With custom year filter:</p>
                <pre>curl "<span id="base-url-year"></span>/api/dsl/stream?year=2027" > c4-core-workspace.dsl</pre>

                <p>Health check:</p>
                <pre>curl <span id="base-url-health"></span>/health</pre>
            </div>
        </div>

        <script>
            // Set base URL dynamically for API examples
            const baseUrl = window.location.origin;
            document.getElementById('base-url').textContent = baseUrl;
            document.getElementById('base-url-year').textContent = baseUrl;
            document.getElementById('base-url-health').textContent = baseUrl;

            async function downloadDSL() {
                const statusDiv = document.getElementById('status');
                statusDiv.className = 'status loading';
                statusDiv.textContent = 'Generating DSL from LeanIX... This may take a moment.';

                try {
                    const response = await fetch('/api/dsl/download');

                    if (!response.ok) {
                        throw new Error(`Server error: ${response.status}`);
                    }

                    const blob = await response.blob();
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = url;
                    a.download = 'c4-core-workspace.dsl';
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(url);
                    document.body.removeChild(a);

                    statusDiv.className = 'status success';
                    statusDiv.textContent = 'DSL downloaded successfully!';

                    setTimeout(() => {
                        statusDiv.className = 'status';
                        statusDiv.textContent = '';
                    }, 3000);
                } catch (error) {
                    statusDiv.className = 'status error';
                    statusDiv.textContent = `Error: ${error.message}`;
                }
            }
        </script>
    </body>
    </html>
    """
    return HTMLResponse(content=html_content)


@app.get("/api/dsl/stream", response_class=PlainTextResponse)
async def stream_dsl(
    year: int = Query(default=2026, description="Filter projects by year"),
    tag: str = Query(default="Enterprise System", description="Tag to filter platforms")
):
    """
    Stream DSL content for curl downloads.

    Usage:
        curl http://localhost:8000/api/dsl/stream > workspace.dsl
        curl "http://localhost:8000/api/dsl/stream?year=2027" > workspace.dsl
    """
    logger.info(f"Streaming DSL - year={year}, tag={tag}")

    try:
        service = DSLGeneratorService()
        result = service.generate_dsl(year=year, tag_name=tag)

        logger.info(
            f"Generated DSL: {result.line_count} lines, "
            f"{result.metadata['platform_count']} platforms, "
            f"{result.container_count} applications"
        )

        return Response(
            content=result.dsl,
            media_type="text/plain; charset=utf-8",
            headers={
                "Content-Disposition": "attachment; filename=c4-core-workspace.dsl"
            }
        )
    except Exception as e:
        logger.error(f"Error generating DSL: {e}", exc_info=True)
        return Response(
            content=f"Error generating DSL: {str(e)}",
            status_code=500,
            media_type="text/plain"
        )


@app.get("/api/dsl/download")
async def download_dsl(
    year: int = Query(default=2026, description="Filter projects by year"),
    tag: str = Query(default="Enterprise System", description="Tag to filter platforms")
):
    """
    Trigger browser download of DSL file.

    This endpoint is used by the web interface download button.
    """
    logger.info(f"Browser download requested - year={year}, tag={tag}")

    try:
        service = DSLGeneratorService()
        result = service.generate_dsl(year=year, tag_name=tag)

        logger.info(
            f"Generated DSL for download: {result.line_count} lines, "
            f"{result.metadata['platform_count']} platforms, "
            f"{result.container_count} applications"
        )

        return Response(
            content=result.dsl,
            media_type="application/octet-stream",
            headers={
                "Content-Disposition": "attachment; filename=c4-core-workspace.dsl"
            }
        )
    except Exception as e:
        logger.error(f"Error generating DSL for download: {e}", exc_info=True)
        return Response(
            content=f"Error generating DSL: {str(e)}",
            status_code=500,
            media_type="text/plain"
        )


@app.get("/health")
async def health_check():
    """
    Health check endpoint for monitoring.
    """
    return {
        "status": "healthy",
        "service": "c4-dsl-generator",
        "timestamp": datetime.utcnow().isoformat(),
        "version": "1.0.0"
    }


if __name__ == "__main__":
    import uvicorn
    import os
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)
