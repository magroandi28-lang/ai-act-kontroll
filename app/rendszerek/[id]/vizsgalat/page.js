import { redirect } from "next/navigation";

export default function RetiredAssessmentRoute({ params }) {
  redirect(`/rendszerek/${params.id}`);
}
