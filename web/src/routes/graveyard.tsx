import site from "../generated/site.json";
import { Document } from "../document";

export default function Graveyard() {
  return <Document document={site.graveyard} />;
}
