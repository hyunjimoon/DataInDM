function Output_1 = Model_01b(x);

%%Simulation Setup
FinalTime = 100;
CurrentTime = 0;
dt = 0.25;

ReportCounter = 1;
ReportInt = 1;
Output_1 = zeros(1,200);
Output_2 = zeros(1,200);
Output_3 = zeros(1,200);

%% Initilialization of the model parameters
PercState = 1;
State = -10;
AdjTime = x(1);
Goal = 0;
InfoDelay = x(2);


%% Model run
while CurrentTime < FinalTime
    
    PercAdjustment = (State-PercState)/InfoDelay ;
    Adjustment = (Goal-PercState)/AdjTime;
    
    State = State + Adjustment*dt;
    PercState = PercState + PercAdjustment*dt;
 
    
    Output_1 (1, ReportCounter)= State;
    Output_2 (1, ReportCounter)= PercState;

    CurrentTime = CurrentTime + dt;
    ReportCounter = ReportCounter + 1;
end


k = 1:1:400;
plot(k,Output_1(1, k));