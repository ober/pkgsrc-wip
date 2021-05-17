
with TCTouch;
package body CC60001_1 is

  function Create return Toggle is
  begin
    TCTouch.Touch ('1');  ------------------------------------------------ 1
    return Toggle'( On => True);
  end Create;

  function Create return Dimmer is
  begin
    TCTouch.Touch ('2');  ------------------------------------------------ 2
    return Dimmer'( On => True, Intensity => 75);
  end Create;

  function Create return Auto_Dimmer is
  begin
    TCTouch.Touch ('3');  ------------------------------------------------ 3
    return  Auto_Dimmer'( On => True, Intensity => 25,
                          Cutout_Threshold | Cutin_Threshold => 50,
                          Auto_Engaged => True);
  end Create;

  function Create return Duo is
  begin
    TCTouch.Touch ('4');  ------------------------------------------------ 4
    return Duo'( On => True, On_2 => True);
  end Create;

  procedure Flip   (It : in out Toggle) is
  begin
    TCTouch.Touch ('A');  ------------------------------------------------ A
    It.On := not It.On;
  end Flip;

  function Is_On   (It : Toggle) return Boolean is
  begin
    TCTouch.Touch ('B');  ------------------------------------------------ B
    return It.On;
  end Is_On;

  procedure Brighten(It : in out Dimmer;
                      By : in Luminance := 10) is
  begin
    TCTouch.Touch ('D');  ------------------------------------------------ D
    if (It.Intensity+By) <= Luminance'Last then
      It.Intensity := It.Intensity+By;
    else
      It.Intensity := Luminance'Last;
    end if;
  end Brighten;

  procedure Dim     (It : in out Dimmer;
                      By : in Luminance := 10) is
  begin
    TCTouch.Touch ('E');  ------------------------------------------------ E
    if (It.Intensity-By) >= Luminance'First then
      It.Intensity := It.Intensity-By;
    else
      It.Intensity := Luminance'First;
    end if;
  end Dim;

  function Intensity(It : Dimmer) return Luminance is
  begin
    TCTouch.Touch ('F');  ------------------------------------------------ F
    if Is_On(It) then ---------------------------------------------------- B
      return It.Intensity;
    else
      return Luminance'First;
    end if;
  end Intensity;

  procedure Flip    (It : in out Dimmer) is
  begin
    TCTouch.Touch ('G');  ------------------------------------------------ G
    if Is_On(It) and (It.Intensity < 50) then ---------------------------- B
      It.Intensity := Luminance'Last - It.Intensity;
    else
      Flip( Toggle(It)); ------------------------------------------------- A
    end if;
  end Flip;

  procedure Set_Auto  (It: in out Auto_Dimmer) is
  begin
    TCTouch.Touch ('H');  ------------------------------------------------ H
    It.Auto_Engaged := True;
  end Set_Auto;

  procedure Clear_Auto(It: in out Auto_Dimmer) is
  begin
    TCTouch.Touch ('I');  ------------------------------------------------ I
    It.Auto_Engaged := False;
  end Clear_Auto;

  function  Auto           (It: Auto_Dimmer) return Boolean is
  begin
    TCTouch.Touch ('J');  ------------------------------------------------ J
    return It.Auto_Engaged;
  end Auto;

  procedure Flip     (It: in out Auto_Dimmer) is
  begin
    TCTouch.Touch ('K');  ------------------------------------------------ K
    if It.Auto_Engaged then
      if not Is_On(It) then ---------------------------------------------- B
       Flip( Dimmer(It));   ---------------------------------------------- G
      else
       It.Auto_Engaged := False;
      end if;
    else
      Flip( Dimmer(It));    ---------------------------------------------- G
    end if;
  end Flip;

  procedure Set_Cutin (It : in out Auto_Dimmer;
                        Lumens : in Luminance) is
  begin
    TCTouch.Touch ('L');  ------------------------------------------------ L
    It.Cutin_Threshold := Lumens;
  end Set_Cutin;

  procedure Set_Cutout(It : in out Auto_Dimmer;
                        Lumens : in Luminance) is
  begin
    TCTouch.Touch ('M');  ------------------------------------------------ M
    It.Cutout_Threshold := Lumens;
  end Set_Cutout;

  function Cutout_Threshold(It : Auto_Dimmer) return Luminance is
  begin
    TCTouch.Touch ('N');  ------------------------------------------------ N
    return It.Cutout_Threshold;
  end Cutout_Threshold;

  function Cutin_Threshold (It : Auto_Dimmer) return Luminance is
  begin
    TCTouch.Touch ('O');  ------------------------------------------------ O
    return It.Cutin_Threshold;
  end Cutin_Threshold;

  procedure Flip_2   (It : in out Duo) is
  begin
    TCTouch.Touch ('R');  ------------------------------------------------ R
    It.On_2 := not It.On_2;
  end Flip_2;

  function Is_On   (It : Duo) return Boolean is
  begin
    TCTouch.Touch ('S');  ------------------------------------------------ S
    return It.On xor It.On_2;
  end Is_On;


  function TC_CW_TI( Key : Character) return Toggle'Class is
  begin
    TCTouch.Touch ('W');  ------------------------------------------------ W
    case Key is
      when 'T' | 't' => return Toggle'( On => True);
      when 'D' | 'd' => return Dimmer'( On => True, Intensity => 75);
      when 'A' | 'a' => return Auto_Dimmer'( On => True, Intensity => 25,
                                 Cutout_Threshold | Cutin_Threshold => 50,
                                 Auto_Engaged => True);
      when '2' => return Duo'( On => True, On_2 => True);
      when others => null;
    end case;
  end TC_CW_TI;

end CC60001_1;
