let 
    Source = Csv.Document(
        File.Contents("C:\\Users\\user\\Desktop\\Retail-Sales-Dashboard\\Sample - Superstore.csv"),
        [Delimiter = ",", Columns = 21, Encoding = 65001, QuoteStyle = QuoteStyle.Csv]
    ),
    PromoteHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
    ChangeTypes = Table.TransformColumnTypes(PromoteHeaders, {
        {"Row ID", Int64.Type}, {"Order ID", type text}, {"Order Date", type date},
        {"Ship Date", type date}, {"Ship Mode", type text}, {"Customer ID", type text},
        {"Customer Name", type text}, {"Segment", type text}, {"Country", type text},
        {"City", type text}, {"State", type text}, {"Postal Code", type text},
        {"Region", type text}, {"Product ID", type text}, {"Category", type text},
        {"Sub-Category", type text}, {"Product Name", type text}, {"Sales", type number},
        {"Quantity", Int64.Type}, {"Discount", type number}, {"Profit", type number}
    })
in
    ChangeTypes
