@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking Restricted View'

@Metadata.allowExtensions: true

define view entity ZR_D_BookingTP2
  as select from ZI_D_Booking

  association to parent ZR_D_CustomerTP2 as _Customer on $projection.CustomerId = _Customer.CustomerId 

{
   key TravelId,
   key BookingId,
ConnectionId,
      BookingDate,
      CustomerId,
      CarrierId as AirlineId,
      FlightDate,
      FlightPrice,
      CurrencyCode,

      // Association
      _Customer
      }
