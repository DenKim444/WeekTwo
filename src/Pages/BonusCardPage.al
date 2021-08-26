page 52122400 "Bonus Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Header";
    Caption = 'Bonus Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Numbers';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the User LoggedIn';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer No.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Customer Name';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Starting Date';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    //ToolTip = 'Specifies End Date';
                    ToolTipML = 'Specifies End Date';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Status';
                }
            }
            part(Lines; "Bonus Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Customer Card")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
                trigger OnAction()
                begin

                end;
            }
            action("Bonus Ledger  Entries")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                RunObject = page "Bonus Ledger Entry";
                RunPageLink = "Bonus No." = field("No.");
            }
            action("Bonus Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Report;
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("No.", Rec."No.");
                    Rec.SetRange("Customer No.", Rec."Customer No.");
                    Report.Run(Report::"Bonus Card Report", true, true, Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}