report 52122400 "Customer Invoices"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/SSRS/Customer Invoices.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const("Invoice"));
            RequestFilterFields = "Sell-to Customer No.", "Document Date";
            column(Cust_No; "Sell-to Customer No.")
            { }
            column(Cust_Name; "Sell-to Customer Name")
            { }
            column(Cust_Address; "Sell-to Address")
            { }
            column(Cust_Address_2; "Sell-to Address 2")
            { }
            column(Cust_PostCode; "Sell-to Post Code")
            { }
            column(Cust_City; "Sell-to City")
            { }
            column(External_Document_No_; "External Document No.")
            { }
            column(Logo; CompanyInfor.Picture)
            { }
            column(UserId; UserID)
            { }
            column(CDT; CurrentDateTime)
            { }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Document_Type; "Document Type")
                { }
                column(Document_No_; "Document No.")
                { }
                column(Entry_No; "Line No.")
                { }
                column(Amount; Amount)
                { }
            }
        }


    }

    trigger OnPreReport()
    begin
        CompanyInfor.get;
        CompanyInfor.CalcFields(Picture);
    end;

    var
        CompanyInfor: Record "Company Information";
}