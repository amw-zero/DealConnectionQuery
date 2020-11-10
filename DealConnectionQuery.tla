------------------------ MODULE DealConnectionQuery ------------------------
EXTENDS FiniteSets, Naturals

CONSTANTS Tenants, Loi, Inquiry

VARIABLES deal, deals

Stages == {Loi, Inquiry}

Deals == [tenant: Tenants, stage: Stages]

Init == /\ deal \in Deals 
        /\ deals \in SUBSET Deals

ConnectionExists(d) == \E dd \in deals: dd.stage = Loi /\ dd.tenant = d.tenant 

Next == FALSE /\ deal' = {}

QueryCorrect == ConnectionExists(deal) => ~(deal \in deals)  
    
=============================================================================
\* Modification History
\* Last modified Tue Nov 03 22:52:53 EST 2020 by alex.weisberger
\* Created Thu Oct 22 20:24:40 EDT 2020 by alex.weisberger
