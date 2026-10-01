import site from "../generated/site.json";
import { Document } from "../document";

export default function Resume() {
  return <Document document={site.resume} />;
}
