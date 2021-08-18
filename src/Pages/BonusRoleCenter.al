page 52122404 "Bonus RoleCenter"
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }

        }
    }

    actions
    {
        area(Sections)
        {
            group(Bonus)
            {
                ToolTip = 'This is Bonus Role Center Page';
                Caption = 'Bonus RoleCentre';
                action("Bonus List")
                {
                    ApplicationArea = All;
                    Caption = 'Bonus List';
                    RunObject = Page "Bonus List";
                    ToolTip = 'Specifies a List of Bonuses';
                }
                action("New Bonus Card")
                {
                    ApplicationArea = All;
                    Caption = 'New Bonus Card';
                    RunObject = Page "Bonus Card";
                    ToolTip = 'Create New Bonus Card For Customer';
                }
            }
        }

    }
}