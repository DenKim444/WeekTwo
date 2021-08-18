page 52122402 "Bonus Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Setup";

    layout
    {
        area(Content)
        {
            group(Setups)
            {
                field("Bonus Nos"; Rec."Bonus Nos")
                {
                    ApplicationArea = All;
                }
            }
        }
    }



    var
        myInt: Integer;
}