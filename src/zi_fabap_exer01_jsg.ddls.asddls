@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercio 1 CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_EXER01_JSG as select from /dmo/flight as flight
inner join /dmo/carrier as carrier on flight.carrier_id = carrier.carrier_id
{
     key flight.carrier_id as CarrierId,
     key flight.connection_id as ConnectionId,
     key flight.flight_date as FlightDate,
     flight.seats_max as SeatsMax,
     flight.seats_occupied as SeatsOccupied,   
     carrier.name as Name,
     concat( cast( cast( flight.seats_occupied / flight.seats_max * 100 as abap.dec( 8, 2 ) ) as abap.char( 10 ) ) , ' %' ) as percentage_occupied
}
