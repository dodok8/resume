import { For, createMemo } from "solid-js";
import { Dynamic } from "solid-js/web";

export type ContentNode = {
  type: string;
  text?: string;
  children?: ContentNode[];
  caption?: ContentNode[];
  href?: string;
  src?: string;
  alt?: string | null;
  name?: string;
  level?: number;
  block?: boolean;
};

const base = import.meta.env.BASE_URL;
function Node(props: { node: ContentNode }) {
  return <>{renderNode(props.node)}</>;
}

function renderNode(node: ContentNode) {
  const children = () => <For each={node.children}>{(child) => <Node node={child} />}</For>;
  switch (node.type) {
    case "text":
      return <>{node.text}</>;
    case "linebreak":
      return <br />;
    case "parbreak":
      return null;
    case "link":
      return <a href={node.href}>{children()}</a>;
    case "strong":
      return <strong>{children()}</strong>;
    case "emph":
      return <em>{children()}</em>;
    case "super":
      return <sup>{children()}</sup>;
    case "sub":
      return <sub>{children()}</sub>;
    case "footnote":
      return <small> ({children()})</small>;
    case "code":
      return node.block ? (
        <pre>
          <code>{node.text}</code>
        </pre>
      ) : (
        <code>{node.text}</code>
      );
    case "heading":
      return (
        <Dynamic component={`h${Math.min(6, Math.max(2, node.level ?? 2))}`}>{children()}</Dynamic>
      );
    case "list-item":
    case "ordered-item":
      return (
        <li>
          <RichContent nodes={node.children ?? []} />
        </li>
      );
    case "figure":
      return (
        <figure>
          {children()}
          <figcaption>
            <RichContent nodes={node.caption ?? []} />
          </figcaption>
        </figure>
      );
    case "image":
      return <img src={`${base}${node.src?.replace(/^\.\//, "")}`} alt={node.alt ?? ""} />;
    case "icon": {
      const [name, query] = (node.name ?? "").split("?");
      const color = new URLSearchParams(query).get("color");
      const path = `${name}${color ? `-${color}` : ""}.svg`
        .split("/")
        .map(encodeURIComponent)
        .join("/");
      return <img class="icon" src={`${base}icons/${path}`} alt="" />;
    }
    default:
      throw new Error(`Unsupported content node: ${node.type}`);
  }
}

export function RichContent(props: { nodes: ContentNode[] }) {
  const groups = createMemo(() => {
    const groups: { type: "paragraph" | "list" | "block"; nodes: ContentNode[] }[] = [];
    let paragraph: ContentNode[] = [];
    const flush = () => {
      if (paragraph.some((node) => node.type !== "text" || node.text?.trim())) {
        groups.push({ type: "paragraph", nodes: paragraph });
      }
      paragraph = [];
    };
    for (const node of props.nodes) {
      if (node.type === "parbreak") {
        flush();
        continue;
      }
      if (node.type === "list-item" || node.type === "ordered-item") {
        flush();
        const previous = groups.at(-1);
        if (previous?.type === "list" && previous.nodes[0].type === node.type)
          previous.nodes.push(node);
        else groups.push({ type: "list", nodes: [node] });
      } else if (
        node.type === "figure" ||
        node.type === "heading" ||
        (node.type === "code" && node.block)
      ) {
        flush();
        groups.push({ type: "block", nodes: [node] });
      } else {
        paragraph.push(node);
      }
    }
    flush();
    return groups;
  });
  return (
    <For each={groups()}>
      {(group) => {
        const nodes = () => <For each={group.nodes}>{(node) => <Node node={node} />}</For>;
        if (group.type === "list")
          return group.nodes[0].type === "ordered-item" ? <ol>{nodes()}</ol> : <ul>{nodes()}</ul>;
        if (group.type === "paragraph") return <p>{nodes()}</p>;
        return nodes();
      }}
    </For>
  );
}

export function InlineContent(props: { nodes: ContentNode[] }) {
  return <For each={props.nodes}>{(node) => <Node node={node} />}</For>;
}
