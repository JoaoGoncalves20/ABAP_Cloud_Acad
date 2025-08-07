CLASS zcl_fabap_jul2025_exer04_jsg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER04_JSG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT * FROM zi_fabap_exer03_jsg
        INTO TABLE @DATA(lt_cds_exer03).

    SELECT * FROM zi_fabap_exer02_jsg
        INTO TABLE @DATA(lt_cds_exer02).

    SELECT * FROM zi_fabap_exer01_jsg
        INTO TABLE @DATA(lt_cds_exer01).

        out->write( '1º CDS' ).
        out->write( lt_cds_exer01 ).

        out->write( '-----------------------------' ).
        out->write( '2º CDS' ).
        out->write( lt_cds_exer02 ).

        out->write( '-----------------------------' ).
        out->write( '3º CDS' ).
        out->write( lt_cds_exer03 ).

  ENDMETHOD.
ENDCLASS.
