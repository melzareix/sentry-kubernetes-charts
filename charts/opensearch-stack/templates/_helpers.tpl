{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "efk.fullname" -}}
{{- printf "%s" .Release.Name }}
{{- end }}


{{/*
Expand the name of the chart.
*/}}
{{- define "efk.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "efk.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "efk.selectorLabels" -}}
app.kubernetes.io/name: {{ include "efk.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "efk.labels" -}}
helm.sh/chart: {{ include "efk.chart" . }}
{{ include "efk.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Generate certificates for custom-metrics api server
*/}}
{{- define "efk.gen-certs" -}}
{{- $altNames := list ( printf "%s.%s" (include "efk.name" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "efk.name" .) .Release.Namespace ) -}}
{{- $ca := genCA "efk-ca" 768 -}}
root-ca-key.pem: {{ $ca.Key | b64enc}}
root-ca.pem: {{ $ca.Cert | b64enc}}
{{- end -}}
