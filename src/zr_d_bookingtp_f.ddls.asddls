@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking for Flights'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity ZR_D_BookingTP_F
  as select from ZI_D_Booking

  association        to parent ZR_D_FlightTP2 as _Flight
    on  $projection.CarrierId    = _Flight.CarrierId
    and $projection.ConnectionId = _Flight.ConnectionID
    and $projection.FlightDate   = _Flight.FlightDate
   association [1..1] to /dmo/suppl_text      as _SupplementTexts on  $projection.SupplementId = _SupplementTexts.supplement_id

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      _Carrier.name as CarrierName,
      concat_with_space(concat_with_space(_Customer.title, _Customer.first_name, 1), _Customer.last_name, 1) as CustomerName,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => ZI_D_Booking.FlightPrice,
                          source_currency    => ZI_D_Booking.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'SET_TO_NULL') as FlightPrice,

      cast('EUR' as abap.cuky)                                 as CurrencyCode,

      _Flight,
      _Carrier,
      SupplementId,
      concat( concat(TravelId, ' / '), BookingId ) as TravelBookingDisplay,
      _SupplementTexts.description as SupplementDescription,
            case when instr(_SupplementTexts.supplement_id, 'BV') > 0 then 'Beverage'
            when instr(_SupplementTexts.supplement_id, 'ML') > 0 then 'Meal'
            when instr(_SupplementTexts.supplement_id, 'LU') > 0 then 'Luggage'
            when instr(_SupplementTexts.supplement_id, 'EX') > 0 then 'Extra'
            else ''
            end as SupplementCategory
      
}

where FlightDate >= $session.system_date
