@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@ObjectModel.semanticKey: [ 'TravelID' ]
@Search.searchable: true
define root view entity ZC_FE_Travel_001543
  as projection on ZI_FE_Travel_001543
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element: [ 'Description' ]
      TravelID,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]
      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,
      _Agency.Name       as AgencyName,

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: [ 'Lastname' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      CustomerID,
      _Customer.LastName as LastName,
      @EndUserText.label: 'Start Date'
      BeginDate,
      @EndUserText.label: 'End Date'
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Booking Fee'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Total Price'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      Description,
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: [ 'StatusText' ]   
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'ZI_FE_STAT_001543', element: 'TravelStatusId' } }]
      OverallStatus,
      OverallStatusCriticality,
      _TravelStatus.TravelStatusText as StatusText,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      @EndUserText.label: 'Last Change'
      LocalLastChangedAt,
      _Booking : redirected to composition child ZC_FE_Booking_001543,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus

}
