# Feature Gate - ABAP Feature Toggle System

## Overview

Feature Gate is a simple yet powerful feature toggle system for ABAP applications with SAPUI5/Fiori frontends. It allows you to enable or disable features at runtime without code deployments, following the feature flag pattern.

## Key Features

- Runtime feature activation/deactivation
- Two methods of feature checking: by class reference or by name
- Integration with ABAP OO classes via interface
- Audit trail with creation/changed timestamps and users
- Simple UI for feature management

## Installation

1. Import the ABAP classes into your SAP system
2. Deploy the SAPUI5/Fiori application (if using the UI component)

## Usage

### Implementing a Feature

1. Create a class that implements the `ZIF_FG_FEATURE` interface:

```abap
CLASS zcl_feature_gate_demo01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_fg_feature.
    
    METHODS get_date
      RETURNING
        VALUE(rv_date) TYPE sy-datum.
ENDCLASS.

CLASS zcl_feature_gate_demo01 IMPLEMENTATION.
  METHOD get_date.
    rv_date = sy-datum.
  ENDMETHOD.
ENDCLASS.
```

### Checking Feature Status

You can check if a feature is active in two ways:

1. **By class reference**:
```abap
DATA(lo_demo01) = NEW zcl_feature_gate_demo01( ).
IF zcl_feature_gate=>is_active_by_ref( lo_demo01 ).
  " Feature is active - execute code
  lo_demo01->get_date( ).
ELSE.
  " Feature is inactive
ENDIF.
```

2. **By class name**:
```abap
IF zcl_feature_gate=>is_active_by_name( 'ZCL_FEATURE_GATE_DEMO02' ).
  " Feature is active
ELSE.
  " Feature is inactive
ENDIF.
```

## Administration

Features can be managed through the Fiori application interface where administrators can:
- View all registered features
- Toggle features ON/OFF
- Track creation and modification history
