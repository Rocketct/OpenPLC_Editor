PROGRAM program0
  VAR
    IN0 AT %IX0.0 : BOOL;
    IN1 AT %IX0.1 : BOOL;
    IN2 AT %IX0.2 : BOOL;
    IN3 AT %IX0.3 : BOOL;
    IN4 AT %IX0.4 : BOOL;
    OUT0 AT %QX0.0 : BOOL;
    OUT1 AT %QX0.1 : BOOL;
    OUT2 AT %QX0.2 : BOOL;
    OUT3 AT %QX0.3 : BOOL;
  END_VAR
  VAR
    TON0 : TON;
    TOF0 : TOF;
  END_VAR

  TON0(IN := NOT(OUT3), PT := T#500ms);
  TOF0(IN := TON0.Q, PT := T#500ms);
  OUT3 := TOF0.Q;
  
  OUT0 := IN0 AND IN1;
  OUT1 := IN2 AND IN3;
  OUT2 := IN4;
  
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#2ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
