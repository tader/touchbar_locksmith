function fish_prompt_touchbar_locksmith --on-event fish_prompt
  set -q TOUCHBAR_LOCKSMITH_KEY ; or return 1

  if test -n "$AWS_SESSION_ACCOUNT_NAME"
    if test -n "$AWS_SESSION_EXPIRES"
      set now (date +%s)
      set remaining (math $AWS_SESSION_EXPIRES-$now)

      if test "$remaining" -le 0
        touchbar_set F$TOUCHBAR_LOCKSMITH_KEY 🔒Expired
      else
        set remainingm (printf "%.0f" (math -s9 $remaining/60))
        set hand (printf "%.0f" (math -s9 $remaining/300))

        switch "$hand"
          case 12; set clock 🕛
          case 11; set clock 🕐
          case 10; set clock 🕑
          case  9; set clock 🕒
          case  8; set clock 🕓
          case  7; set clock 🕔
          case  6; set clock 🕕
          case  5; set clock 🕖
          case  4; set clock 🕗
          case  3; set clock 🕘
          case  2; set clock 🕙
          case  1; set clock 🕚
          case  0; set clock 🕛
          case '*'; set clock ⏳
        end


        if test "$remaining" -le 90
          set s s
          set left "   $clock$remaining$s 🔔"
        else if test "$remaining" -le 630
          set left "   $clock$remainingm 🔔"
        else
          set left "   $clock$remainingm"
        end
        touchbar_set F$TOUCHBAR_LOCKSMITH_KEY 🔐$AWS_SESSION_ACCOUNT_NAME$left # 🔑
      end
    end
  else
    touchbar_set F$TOUCHBAR_LOCKSMITH_KEY 🔒Locksmith
  end
end
