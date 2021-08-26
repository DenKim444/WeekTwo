/// <summary>
/// Report Bonus Card Report (ID 52122401).
/// </summary>
report 52122402 "Bonus Card Word Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    //WordLayout = 'src/Reports/Word/Bonus Card.docx/';
    //RDLCLayout = 'src/Reports/SSRS/Bonus Card Report.rdl';
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
            dataitem("Bonus Entry"; "Bonus Entry")
            {
                DataItemLink = "Bonus No." = Field("No.");

                RequestFilterFields = "Posting Date";
                column(Bonus_No; "Bonus No.")
                { }
                column(Document_No; "Document No.")
                { }
                column(Posting_Date; "Posting Date")
                { }
                column(Item_No_; "Item No.")
                { }
                column(Bonus_Amount; "Bonus Amount")
                { }
            }
        }
    }

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
}