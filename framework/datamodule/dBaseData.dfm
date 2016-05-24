inherited dtmBaseData: TdtmBaseData
  OldCreateOrder = True
  Height = 235
  Width = 353
  object qryData: TFDQuery
    Left = 48
    Top = 16
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspData'
    BeforePost = cdsDataBeforePost
    AfterPost = cdsDataAfterPost
    AfterCancel = cdsDataAfterCancel
    AfterDelete = cdsDataAfterDelete
    OnReconcileError = cdsDataReconcileError
    Left = 48
    Top = 168
  end
  object dspData: TDataSetProvider
    DataSet = qryData
    Left = 48
    Top = 88
  end
end
