import { redirect } from "next/navigation";

export default function RetiredResultRoute({ params }) {
  redirect(`/rendszerek/${params.id}`);
}
