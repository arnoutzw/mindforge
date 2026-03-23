// MindForge — User Manual
// Black Sphere Industries

#set document(title: "MindForge — User Manual", author: "Black Sphere Industries")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm))
#set text(font: "New Computer Modern", size: 11pt)
#set heading(numbering: "1.1")

// ── Title page ──
#align(center)[
  #v(4cm)
  #text(size: 28pt, weight: "bold")[MindForge]
  #v(0.5cm)
  #text(size: 14pt, fill: rgb("#71717a"))[Visual Engineering Intelligence]
  #v(2cm)
  #text(size: 16pt)[User Manual]
  #v(1cm)
  #line(length: 40%, stroke: 0.5pt + rgb("#f59e0b"))
  #v(1cm)
  #text(size: 11pt, fill: rgb("#71717a"))[
    Black Sphere Industries \
    Version 1.0 --- March 2026
  ]
]

#pagebreak()
#outline(title: "Table of Contents", indent: 1.5em)
#pagebreak()

= Introduction

MindForge is a visual engineering mind-mapping tool developed by Black Sphere Industries. It enables engineers and product teams to create structured diagrams for system decomposition, FMEA (Failure Mode and Effects Analysis), requirements tracing, and general-purpose brainstorming.

Unlike generic mind-mapping tools, MindForge is purpose-built for engineering workflows. Nodes are typed (Function, Requirement, Failure Mode, Component, Test Case, Problem, Cause, Effect, or Generic) with color-coded visual identity, and connections carry semantic labels (decomposes into, causes, verified by, mitigates).

MindForge integrates with Firebase for real-time cloud persistence and cross-device synchronization, with a full-featured demo mode backed by localStorage. It also supports pushing nodes to other BSI apps (ForgedAgile, ReqForge, ForgedOps).

= Getting Started

== System Requirements

- A modern web browser (Chrome, Firefox, Edge, Safari)
- Firebase-backed mode requires authentication via the BSI portal
- Demo mode (`?demo=true`) requires no authentication and stores data locally

== Launching the Application

=== Via the BSI Portal
MindForge loads as an iframe within the BSI portal. Authentication, project context, and theme are managed by the portal via postMessage communication.

=== Standalone Mode
Open the application URL directly. Append `?demo=true` to the URL to activate demo mode with local storage persistence.

== First Steps

+ Create a new mind map using the *New Map* button in the sidebar
+ Add nodes by clicking the *+ Node* button in the header or double-clicking the canvas
+ Drag between node connectors to create connections
+ Right-click a node for context menu options (edit, change type, push to app, delete)

= Features

== Node Types

MindForge supports nine semantically typed nodes, each with a distinctive color:

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  [*Type*], [*Color*], [*Use Case*],
  [Function], [Blue], [System functions in functional decomposition],
  [Requirement], [Amber], [Requirements from specifications],
  [Failure Mode], [Red], [FMEA failure modes],
  [Component], [Green], [Physical or software components],
  [Test Case], [Purple], [Verification test cases],
  [Problem], [Pink], [Root cause analysis problems],
  [Cause], [Orange], [RCA causal factors],
  [Effect], [Cyan], [RCA effects],
  [Generic], [Gray], [General-purpose nodes],
)

Each node displays a title, optional metadata, and a type badge. Nodes can be assigned a priority (Low, Medium, High, Critical) and a status (Active, Completed, Blocked, On Hold).

== Connection Types

Connections between nodes carry semantic labels:
- *decomposes into* --- Hierarchical decomposition (gray arrow)
- *causes* --- Causal relationship (red arrow)
- *verified by* --- Verification traceability (purple arrow)
- *mitigates* --- Risk mitigation link (green arrow)

Connections are rendered as curved SVG paths with directional arrowheads and optional labels.

== Canvas Interaction

=== Navigation
- *Pan:* Click and drag on the canvas background, or hold Space and drag
- *Zoom:* Mouse wheel, pinch gesture, or use the zoom slider in the header
- *Fit to screen:* Click the fit button to auto-center all nodes

=== Node Operations
- *Move:* Click and drag a node to reposition it
- *Select:* Click a node to select it (highlighted with accent border)
- *Connect:* Hover over a node to reveal connector ports; drag from a port to another node
- *Edit:* Double-click a node or right-click and select Edit
- *Delete:* Right-click and select Delete

=== Context Menu
Right-clicking a node opens a context menu with:
- Edit --- Open the node editor modal
- Change Type --- Sub-menu to change the node's type
- Push to App --- Send the node to ForgedAgile (Scrum), ReqForge, or ForgedOps (ALM)
- Delete --- Remove the node and its connections

== Mind Map Management

=== Sidebar
The collapsible sidebar lists all mind maps in the current project. Click a map name to switch to it. The *New Map* button creates a fresh canvas.

=== Export
Two export formats are available from the sidebar footer:
- *.mindforge* --- Native JSON format preserving all node/connection data and layout
- *.png* --- Rasterized image of the current canvas

=== Import
Import `.mindforge` or `.mmap` files via the Import button. This restores all nodes, connections, and canvas layout.

== Minimap

A minimap in the bottom-right corner of the canvas shows a bird's-eye overview of the entire map. The viewport rectangle indicates the currently visible area and can be used for quick navigation.

== Theme Support

MindForge supports dark (default, amber/zinc) and light (deep blue) themes:
- When embedded in the BSI portal, the theme is controlled by the portal
- In standalone mode, a theme toggle button is available in the header
- Theme preference is persisted to localStorage

== Real-Time Synchronization

When connected to Firebase (via the BSI portal with an authenticated user):
- Changes are saved to Firestore in real time (debounced at 500 ms)
- Remote changes from other users/devices are applied automatically via onSnapshot listeners
- Conflict handling: if a node is being edited when a remote update arrives, the remote data is stashed and applied when the edit modal closes
- localStorage serves as a fallback and offline cache

== Demo Mode

Append `?demo=true` to the URL to activate demo mode:
- All data is stored in localStorage (no Firebase required)
- A demo banner appears at the top with *Exit Demo* and *Reset Data* buttons
- Seed data is generated for the default project, providing example system decomposition and FMEA maps

== Cross-App Integration

MindForge nodes can be pushed to other BSI applications via the "Push to App" context menu:
- *Push to Scrum* --- Sends to ForgedAgile as a backlog item
- *Push to ReqForge* --- Creates a requirement in ReqForge
- *Push to ALM* --- Creates a defect or work item in ForgedOps

This integration works via postMessage when embedded in the BSI portal.

= User Interface

== Sidebar
- BSI traffic-light dots and app branding
- List of mind maps with click-to-switch
- New Map button
- Export/Import controls in the footer

== Header
- Current map name
- Zoom controls (zoom out, slider, zoom in, percentage label)
- Fit to screen button
- Add Node button
- Theme toggle (standalone mode only)
- User info with online/offline status indicator

== Canvas
- SVG-based infinite canvas with dot-grid background
- Layered rendering: groups layer, connections layer, nodes layer, drag-connection layer
- Minimap overlay in the bottom-right corner

== Modals
- Node editor modal for editing title, type, priority, status, and description
- New map modal for creating maps with a name

== Toast Notifications
Success, error, and info toasts appear in the bottom-right corner for operation feedback.

= Workflows

== System Decomposition

+ Create a new map named "System Decomposition"
+ Add a top-level Function node for the system
+ Add child Function nodes for sub-functions
+ Connect parent to children with "decomposes into" connections
+ Add Component nodes and link them to functions
+ Add Requirement nodes and link with "verified by" to Test Case nodes

== FMEA (Failure Mode and Effects Analysis)

+ Create a new map named "FMEA"
+ Add Function nodes for each system function
+ Add Failure Mode nodes for potential failure modes
+ Connect functions to failure modes with "causes" connections
+ Add mitigation nodes (Component or Generic) and connect with "mitigates"
+ Add Test Case nodes for verification coverage

== Root Cause Analysis

+ Create a new map
+ Add a Problem node at the center
+ Add Cause nodes radiating outward
+ Add Effect nodes showing downstream impacts
+ Connect with "causes" relationships to build the causal chain

= Architecture

This section presents the software architecture of MindForge using UML diagrams.

== Class Diagram

#figure(
  image("uml-class-diagram.svg", width: 100%),
  caption: [Class diagram showing state management, node types, and persistence layers.]
)

== Main Interaction Sequence

#figure(
  image("uml-seq-main.svg", width: 100%),
  caption: [Sequence diagram for node creation and canvas rendering.]
)

== User Interaction Sequence

#figure(
  image("uml-seq-interaction.svg", width: 100%),
  caption: [Sequence diagram for canvas interactions (pan, zoom, connect, edit).]
)

== Secondary Sequences

#figure(
  image("uml-seq-secondary.svg", width: 100%),
  caption: [Sequence diagrams for export, import, and cross-app push operations.]
)

== State Diagram

#figure(
  image("uml-states.svg", width: 100%),
  caption: [State machine diagram showing canvas interaction states.]
)

= Configuration

== Firebase Configuration
When embedded in the BSI portal, Firebase configuration is received via postMessage. The app initializes Firebase Auth and Firestore for authenticated cloud persistence.

== Demo Mode
Activate with `?demo=true` in the URL. Data is stored in localStorage under keys prefixed with `demo_db_mindforge_`. Demo mode can be exited or reset via the demo banner buttons.

== Project Context
MindForge supports multi-project isolation. When embedded in the portal, the active project ID is received via postMessage, and all data is scoped to that project (both in localStorage and Firestore).

== Storage Keys
- `mindforge_theme` --- Theme preference (dark/light)
- `mindforge_demo` --- Demo mode flag
- `demo_db_mindforge_<projectId>_maps` --- Map data per project
- `demo_db_mindforge_<projectId>_active` --- Active map ID per project

= Troubleshooting

== Common Issues

/ Nodes not saving: In demo mode, data is saved to localStorage. Check that localStorage is not full or blocked by browser privacy settings. In Firebase mode, ensure authentication is active (check the user info indicator in the header).
/ Canvas blank after switching projects: The app reloads data when the project context changes. If data fails to load from Firestore, it falls back to localStorage. Check the browser console for error messages.
/ "OFFLINE" indicator persists: The app is running in demo mode or Firebase initialization failed. Verify network connectivity and authentication status.
/ Export file empty: Ensure the map has at least one node before exporting.
/ Push to App not working: This feature requires the app to be embedded in the BSI portal. It does not work in standalone mode.
/ Theme not changing: When embedded in the portal, the theme is controlled by the parent frame. The local theme toggle is hidden in embedded mode.
