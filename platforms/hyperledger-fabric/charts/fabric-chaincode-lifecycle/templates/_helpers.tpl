{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "fabric-chaincode-lifecycle.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "fabric-chaincode-lifecycle.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fabric-chaincode-lifecycle.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Endorser names for commit operation
*/}}
{{- define "endorser.names" -}}
{{- $names := list -}}
{{- range .Values.endorsers -}}
{{- $names = append $names .name -}}
{{- end -}}
{{- join " " $names -}}
{{- end }}

{{/*
Endorser addresses for commit operation
*/}}
{{- define "endorser.addresses" -}}
{{- $addresses := list -}}
{{- range .Values.endorsers -}}
{{- $addresses = append $addresses .corePeerAddress -}}
{{- end -}}
{{- join " " $addresses -}}
{{- end }}

{{- define "labels.custom" -}}
{{- range $value := .Values.labels.custom }}
{{ toYaml $value }}
{{- end }}
{{- end }}
