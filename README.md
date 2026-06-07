# FortiAnalyzer Use Cases

Este repositorio documenta casos de uso prácticos de **FortiAnalyzer (FAZ)** para la detección de amenazas, correlación de eventos y respuesta a incidentes. Cada carpeta corresponde a un caso de uso independiente con su documentación, archivos de configuración y scripts de prueba.

## Casos de Uso

| Carpeta | Descripción |
|---|---|
| [`faz-windows-server`](./faz-windows-server/) | Integración de logs de Windows Server con FortiAnalyzer mediante FortiClient o NXLog |
| [`faz-fmlws`](./faz-fmlws/) | Integración de FortiMail Workspace con FortiAnalyzer: log parser CEF, event handlers, playbook y reportes |

## Requisitos Generales

- FortiAnalyzer 8.0 (versión validada para los casos de uso publicados)
- Acceso administrativo al FAZ para importar parsers y crear event handlers
- Windows Server 2025 para el caso de uso de ingesta de logs Windows

## Cómo usar este repositorio

Cada carpeta de caso de uso contiene su propio `README.md` con instrucciones paso a paso. Se recomienda seguir el orden presentado dentro de cada caso de uso, ya que los componentes tienen dependencias entre sí (el parser debe importarse antes de crear los event handlers).

## Contribuciones

Los casos de uso están organizados de forma modular. Para agregar uno nuevo, crea una carpeta con nombre descriptivo y sigue la misma estructura de documentación.
