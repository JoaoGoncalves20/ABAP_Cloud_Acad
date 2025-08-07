CLASS zcl_fabap_jul2025_exer01_e_jsg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_JSG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lv_value TYPE i VALUE 5.

    DATA(lo_produto) = NEW zcl_fabap_jul2025_exer01_jsg( iv_code = 'A001'
                                                         iv_name = 'Prod. A'
                                                         iv_price = '11.99'  ).

    out->write( |{ 'Produto:' } { lo_produto->get_code( ) }|  ).
    out->write( |{ 'Descrição:' } { lo_produto->get_name( ) }| ).
    out->write( |{ 'Preço:' } { lo_produto->get_price( ) } | ).

    lo_produto->add_stock( 10 ).
    out->write( |{ 'Stock:' } { lo_produto->get_stock( ) }| ).
    out->write( |{ 'Valor total:' } { lo_produto->calc_total_value(  ) }| ).

    out->write( |{ 'Remover ' } { lv_value } { 'do Stock.' }| ).
    DATA(lv_result) = lo_produto->remove_stock( lv_value ).
    IF lv_result = abap_true.
      out->write( |{ 'Novo Stock:' } { lo_produto->get_stock( ) }| ).
      out->write( |{ 'Novo Valor total :' } { lo_produto->calc_total_value(  ) }| ).
    ELSE.
      out->write( 'Stock Insuficiente' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
