import site from "../generated/site.json";
import { Document } from "../document";

export default function Portfolio() {
  return <Document document={site.portfolio} />;
}
