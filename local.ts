import app from "./server.ts";
import path from "path";
import express from "express";
import { createServer as createViteServer } from "vite";

const PORT = 3000;

// Vite middleware integration for full-stack functionality
const startServer = async () => {
  if (process.env.NODE_ENV !== "production") {
    console.log("Setting up Express in DEVELOPMENT mode with Vite Middleware...");
    const vite = await createViteServer({
      server: { middlewareMode: true },
      appType: "spa",
    });
    app.use(vite.middlewares);
  } else {
    console.log("Setting up Express in PRODUCTION mode...");
    const distPath = path.join(process.cwd(), 'dist');
    app.use(express.static(distPath));
    app.get('*', (req, res) => {
      res.sendFile(path.join(distPath, 'index.html'));
    });
  }

  app.listen(PORT, "0.0.0.0", () => {
    console.log(`[Retinal Scan AI Backend] listening on http://0.0.0.0:${PORT}`);
  });
};

startServer().catch((err) => {
  console.error("Failed to bootstrap full stack Express-Vite backend server:", err);
});
