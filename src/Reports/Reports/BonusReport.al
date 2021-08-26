/// <summary>
/// Report Bonus Card Report (ID 52122401).
/// </summary>
report 52122401 "Bonus Card Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/SSRS/Bonus Card Report.rdl';
    Caption = 'Bonus Card Report';
    dataset
    {
        dataitem("Bonus Header"; "Bonus Header")
        {
            RequestFilterFields = "No.", "Customer No.";
            column(No; "No.")
            { }
            column(Customer_No; "Customer No.")
            { }
            column(Customer_Name; "Customer Name")
            { }
            column(Starting_Date; "Starting Date")
            { }
            column(End_Date; "End Date")
            { }
            column(Status; Status)
            { }
            column(Created_By; "Created By")
            { }
            column(CDT; CurrentDateTime)
            { }
            column(NoLBL; NoLBL)
            { }
            column(Cust_NoLBL; Cust_NoLBL)
            { }
            column(Cust_NameLBL; Cust_NameLBL)
            { }
            column(S_DATELBL; S_DATELBL)
            { }
            column(E_DateLBL; E_DateLBL)
            { }
            column(StatusLBL; StatusLBL)
            { }
            column(Logo; CompInfor.Picture)
            { }
            column(CustBalance; CustBalance)
            { }

            dataitem("Bonus Entry"; "Bonus Entry")
            {
                DataItemLink = "Bonus No." = Field("No.");

                RequestFilterFields = "Posting Date";
                column(Bonus_No;
                "Bonus No.")
                { }
                column(Document_No; "Document No.")
                { }
                column(Posting_Date; "Posting Date")
                { }
                column(Item_No_; "Item No.")
                { }
                column(Bonus_Amount; "Bonus Amount")
                { }
                trigger OnAfterGetRecord()
                begin

                end;

            }
            trigger OnAfterGetRecord()
            begin
                //Get the Customers Balance
                Customer.Reset();
                Customer.SetRange("No.", "Customer No.");
                if Customer.FindSet() then begin
                    Customer.CalcFields("Balance (LCY)");
                    CustBalance := Customer."Balance (LCY)";
                end;

            end;

        }
    }
    trigger OnPreReport()
    begin
        CompInfor.get;
        CompInfor.CalcFields(Picture);
    end;

    /*     requestpage
        {
            layout
            {
                area(Content)
                {
                    group(GroupName)
                    {
                        field(Name; SourceExpression)
                        {
                            ApplicationArea = All;

                        }
                    }
                }
            }

            actions
            {
                area(processing)
                {
                    action(ActionName)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        } */

    var
        NoLBL: Label 'No';
        Cust_NoLBL: Label 'Customer No.:';
        Cust_NameLBL: Label 'Customer Name:';
        S_DATELBL: Label 'Starting Date:';
        E_DateLBL: Label 'End Date:';
        StatusLBL: Label 'Status:';
        CreatedByLBL: Label 'Created By:';
        CompInfor: Record "Company Information";
        Customer: Record Customer;
        CustBalance: Decimal;
}