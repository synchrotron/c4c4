#!/usr/bin/env python3
"""
Startup script for the C4 DSL Generator web service.

This script starts the FastAPI application using uvicorn with
production-ready settings.

Usage:
    python run_server.py              # Run on default port 8000
    python run_server.py --port 9000  # Run on custom port
    python run_server.py --dev        # Run in development mode with auto-reload
"""

import argparse
import uvicorn


def main():
    parser = argparse.ArgumentParser(
        description="Start the C4 DSL Generator web service"
    )
    parser.add_argument(
        "--host",
        type=str,
        default="0.0.0.0",
        help="Host to bind to (default: 0.0.0.0)"
    )
    parser.add_argument(
        "--port",
        type=int,
        default=8000,
        help="Port to bind to (default: 8000)"
    )
    parser.add_argument(
        "--dev",
        action="store_true",
        help="Run in development mode with auto-reload"
    )
    parser.add_argument(
        "--workers",
        type=int,
        default=1,
        help="Number of worker processes (default: 1)"
    )

    args = parser.parse_args()

    print("=" * 70)
    print("C4 DSL Generator - Web Service")
    print("=" * 70)
    print(f"Starting server on http://{args.host}:{args.port}")
    print()
    print("Endpoints:")
    print(f"  - Web UI:       http://{args.host}:{args.port}/")
    print(f"  - Stream DSL:   http://{args.host}:{args.port}/api/dsl/stream")
    print(f"  - Download DSL: http://{args.host}:{args.port}/api/dsl/download")
    print(f"  - Health check: http://{args.host}:{args.port}/health")
    print()
    print("Example curl usage:")
    print(f"  curl http://{args.host}:{args.port}/api/dsl/stream > workspace.dsl")
    print()
    print("Press CTRL+C to stop the server")
    print("=" * 70)
    print()

    uvicorn.run(
        "app:app",
        host=args.host,
        port=args.port,
        reload=args.dev,
        workers=args.workers if not args.dev else 1,
        log_level="info"
    )


if __name__ == "__main__":
    main()
