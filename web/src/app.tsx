import { Router } from "@solidjs/router";
import { MetaProvider } from "@solidjs/meta";
import { FileRoutes } from "@solidjs/start/router";
import { Suspense } from "solid-js";
import { Notifications } from "./toast";
import "./app.css";

export default function App() {
  return (
    <Router
      base={import.meta.env.BASE_URL.replace(/\/$/, "")}
      root={(props) => (
        <MetaProvider>
          <Suspense>{props.children}</Suspense>
          <Notifications />
        </MetaProvider>
      )}
    >
      <FileRoutes />
    </Router>
  );
}
