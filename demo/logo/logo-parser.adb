-------------------------------------------------------------------------------
-- NAME (body)                  : logo-parser.adb
-- AUTHOR                       : Pascal Pignard
-- ROLE                         : Logo primitive parser unit.
-- NOTES                        : Ada 2012, GNOGA 1.4 beta
--
-- COPYRIGHT                    : (c) Pascal Pignard 2018
-- LICENCE                      : CeCILL V2 (http://www.cecill.info)
-- CONTACT                      : http://blady.pagesperso-orange.fr
-------------------------------------------------------------------------------

with logo_messages.logo_Strings;

package body Logo.Parser is

   procedure Check_Spelling (Name : String) is
   begin
      null; -- Accept anything
   end Check_Spelling;
   function Check_Matched
     (Source  : String;
      Pointer : Integer) return Boolean
   is
   begin
      case Source (Pointer) is
         when ' ' | Character'Val (9) .. Character'Val (15) =>
            return True;  -- Blank must follow
         when others =>
            return False;
      end case;
   end Check_Matched;

   procedure Fill
     (Primitives : out Primitive_Tables.Dictionary;
      Locale     :     ZanyBlue.Text.Locales.Locale_Type)
   is
      use logo_messages.logo_Strings;
   begin
      Primitives.Add (Format_help (Locale), help);
      Primitives.Add (Format_abs (Locale), absolute);
      Primitives.Add (Format_absolute (Locale), absolute);
      Primitives.Add (Format_acos (Locale), arccosine);
      Primitives.Add (Format_additem (Locale), additem);
      Primitives.Add (Format_and (Locale), and_k);
      Primitives.Add (Format_anim (Locale), animation);
      Primitives.Add (Format_animation (Locale), animation);
      Primitives.Add (Format_appendlineflow (Locale), appendlineflow);
      Primitives.Add (Format_arc (Locale), arc);
      Primitives.Add (Format_arccosine (Locale), arccosine);
      Primitives.Add (Format_arcsine (Locale), arcsine);
      Primitives.Add (Format_arctan (Locale), arctan);
      Primitives.Add (Format_asin (Locale), arcsine);
      Primitives.Add (Format_atan (Locale), arctan);
      Primitives.Add (Format_back (Locale), back);
      Primitives.Add (Format_before (Locale), beforep);
      Primitives.Add (Format_beforep (Locale), beforep);
      Primitives.Add (Format_bf (Locale), butfirst);
      Primitives.Add (Format_bk (Locale), back);
      Primitives.Add (Format_bl (Locale), butlast);
      Primitives.Add (Format_black (Locale), black);
      Primitives.Add (Format_blue (Locale), blue);
      Primitives.Add (Format_brown (Locale), brown);
      Primitives.Add (Format_butfirst (Locale), butfirst);
      Primitives.Add (Format_butlast (Locale), butlast);
      Primitives.Add (Format_cd (Locale), changedirectory);
      Primitives.Add (Format_changedirectory (Locale), changedirectory);
      Primitives.Add (Format_char (Locale), character_k);
      Primitives.Add (Format_character (Locale), character_k);
      Primitives.Add (Format_chattcp (Locale), chattcp);
      Primitives.Add (Format_circle (Locale), circle);
      Primitives.Add (Format_clearscreen (Locale), clearscreen);
      Primitives.Add (Format_cleartext (Locale), cleartext);
      Primitives.Add (Format_close (Locale), close);
      Primitives.Add (Format_closeflow (Locale), closeflow);
      Primitives.Add (Format_cos (Locale), cosine);
      Primitives.Add (Format_cosine (Locale), cosine);
      Primitives.Add (Format_count (Locale), count);
      Primitives.Add (Format_countdown (Locale), countdown);
      Primitives.Add (Format_cs (Locale), clearscreen);
      Primitives.Add (Format_ct (Locale), cleartext);
      Primitives.Add (Format_cyan (Locale), cyan);
      Primitives.Add (Format_darkblue (Locale), darkblue);
      Primitives.Add (Format_darkgreen (Locale), darkgreen);
      Primitives.Add (Format_darkred (Locale), darkred);
      Primitives.Add (Format_date (Locale), date);
      Primitives.Add (Format_def (Locale), define);
      Primitives.Add (Format_define (Locale), define);
      Primitives.Add (Format_deletesequence (Locale), deletesequence);
      Primitives.Add (Format_delseq (Locale), deletesequence);
      Primitives.Add (Format_diff (Locale), difference);
      Primitives.Add (Format_difference (Locale), difference);
      Primitives.Add (Format_dir (Locale), directory);
      Primitives.Add (Format_directory (Locale), directory);
      Primitives.Add (Format_distance (Locale), distance);
      Primitives.Add (Format_div (Locale), divide);
      Primitives.Add (Format_divide (Locale), divide);
      Primitives.Add (Format_dot (Locale), dot);
      Primitives.Add (Format_dq (Locale), drawingquality);
      Primitives.Add (Format_drawingquality (Locale), drawingquality);
      Primitives.Add (Format_empty (Locale), emptyp);
      Primitives.Add (Format_emptyp (Locale), emptyp);
      Primitives.Add (Format_endcountdown (Locale), endcountdown);
      Primitives.Add (Format_endflow (Locale), endflow);
      Primitives.Add (Format_equal (Locale), equalp);
      Primitives.Add (Format_equalp (Locale), equalp);
      Primitives.Add (Format_er (Locale), erase);
      Primitives.Add (Format_erall (Locale), eraseall);
      Primitives.Add (Format_erase (Locale), erase);
      Primitives.Add (Format_eraseall (Locale), eraseall);
      Primitives.Add (Format_executetcp (Locale), executetcp);
      Primitives.Add (Format_false (Locale), false_k);
      Primitives.Add (Format_fc (Locale), findcolor);
      Primitives.Add (Format_fd (Locale), forward);
      Primitives.Add (Format_files (Locale), files);
      Primitives.Add (Format_fill (Locale), fill);
      Primitives.Add (Format_fillzone (Locale), fillzone);
      Primitives.Add (Format_findcolor (Locale), findcolor);
      Primitives.Add (Format_first (Locale), first);
      Primitives.Add (Format_fontname (Locale), fontname);
      Primitives.Add (Format_fontsize (Locale), fontsize);
      Primitives.Add (Format_for (Locale), for_k);
      Primitives.Add (Format_forward (Locale), forward);
      Primitives.Add (Format_fput (Locale), fput);
      Primitives.Add (Format_globalmake (Locale), globalmake);
      Primitives.Add (Format_gray (Locale), gray);
      Primitives.Add (Format_green (Locale), green);
      Primitives.Add (Format_grid (Locale), grid);
      Primitives.Add (Format_guiaction (Locale), guiaction);
      Primitives.Add (Format_guibutton (Locale), guibutton);
      Primitives.Add (Format_guidraw (Locale), guidraw);
      Primitives.Add (Format_guimenu (Locale), guimenu);
      Primitives.Add (Format_guiposition (Locale), guiposition);
      Primitives.Add (Format_guiremove (Locale), guiremove);
      Primitives.Add (Format_heading (Locale), heading);
      Primitives.Add (Format_hideturtle (Locale), hideturtle);
      Primitives.Add (Format_home (Locale), home);
      Primitives.Add (Format_ht (Locale), hideturtle);
      Primitives.Add (Format_if (Locale), if_k);
      Primitives.Add (Format_indexsequence (Locale), indexsequence);
      Primitives.Add (Format_indseq (Locale), indexsequence);
      Primitives.Add (Format_instr (Locale), instrument);
      Primitives.Add (Format_instrument (Locale), instrument);
      Primitives.Add (Format_int (Locale), integer_k);
      Primitives.Add (Format_integer (Locale), integer_k);
      Primitives.Add (Format_item (Locale), item);
      Primitives.Add (Format_key (Locale), key);
      Primitives.Add (Format_kill (Locale), kill);
      Primitives.Add (Format_killturtle (Locale), killturtle);
      Primitives.Add (Format_label (Locale), label);
      Primitives.Add (Format_labellength (Locale), labellength);
      Primitives.Add (Format_last (Locale), last);
      Primitives.Add (Format_left (Locale), left);
      Primitives.Add (Format_li (Locale), loadimage);
      Primitives.Add (Format_lightgray (Locale), lightgray);
      Primitives.Add (Format_list (Locale), list);
      Primitives.Add (Format_listentcp (Locale), listentcp);
      Primitives.Add (Format_listflow (Locale), listflow);
      Primitives.Add (Format_listp (Locale), listp);
      Primitives.Add (Format_load (Locale), load);
      Primitives.Add (Format_loadimage (Locale), loadimage);
      Primitives.Add (Format_local (Locale), local);
      Primitives.Add (Format_localmake (Locale), localmake);
      Primitives.Add (Format_log10 (Locale), log10);
      Primitives.Add (Format_lput (Locale), lput);
      Primitives.Add (Format_lt (Locale), left);
      Primitives.Add (Format_magenta (Locale), magenta);
      Primitives.Add (Format_make (Locale), globalmake);
      Primitives.Add (Format_member (Locale), member);
      Primitives.Add (Format_memberp (Locale), memberp);
      Primitives.Add (Format_message (Locale), message);
      Primitives.Add (Format_minus (Locale), minus);
      Primitives.Add (Format_mod (Locale), modulo);
      Primitives.Add (Format_modulo (Locale), modulo);
      Primitives.Add (Format_mouse (Locale), mouse);
      Primitives.Add (Format_mousepos (Locale), mousepos);
      Primitives.Add (Format_mouseposition (Locale), mouseposition);
      Primitives.Add (Format_msg (Locale), msg);
      Primitives.Add (Format_not (Locale), not_k);
      Primitives.Add (Format_number (Locale), numberp);
      Primitives.Add (Format_numberp (Locale), numberp);
      Primitives.Add (Format_op (Locale), output);
      Primitives.Add (Format_openflow (Locale), openflow);
      Primitives.Add (Format_or (Locale), or_k);
      Primitives.Add (Format_orange (Locale), orange);
      Primitives.Add (Format_output (Locale), output);
      Primitives.Add (Format_pasttime (Locale), pasttime);
      Primitives.Add (Format_pc (Locale), pencolor);
      Primitives.Add (Format_pd (Locale), pendown);
      Primitives.Add (Format_pe (Locale), penerase);
      Primitives.Add (Format_pencolor (Locale), pencolor);
      Primitives.Add (Format_pendown (Locale), pendown);
      Primitives.Add (Format_penerase (Locale), penerase);
      Primitives.Add (Format_penpaint (Locale), penpaint);
      Primitives.Add (Format_penreverse (Locale), penreverse);
      Primitives.Add (Format_penshape (Locale), penshape);
      Primitives.Add (Format_penup (Locale), penup);
      Primitives.Add (Format_penwidth (Locale), penwidth);
      Primitives.Add (Format_pi (Locale), pi);
      Primitives.Add (Format_pick (Locale), pick);
      Primitives.Add (Format_pink (Locale), pink);
      Primitives.Add (Format_play (Locale), play);
      Primitives.Add (Format_poall (Locale), printoutall);
      Primitives.Add (Format_pos (Locale), position);
      Primitives.Add (Format_position (Locale), position);
      Primitives.Add (Format_power (Locale), power);
      Primitives.Add (Format_ppt (Locale), penpaint);
      Primitives.Add (Format_pr (Locale), print);
      Primitives.Add (Format_prim (Locale), primitive_k);
      Primitives.Add (Format_primitive (Locale), primitive_k);
      Primitives.Add (Format_print (Locale), print);
      Primitives.Add (Format_printoutall (Locale), printoutall);
      Primitives.Add (Format_proc (Locale), procedure_k);
      Primitives.Add (Format_procedure (Locale), procedure_k);
      Primitives.Add (Format_product (Locale), product);
      Primitives.Add (Format_ps (Locale), penshape);
      Primitives.Add (Format_pu (Locale), penup);
      Primitives.Add (Format_purple (Locale), purple);
      Primitives.Add (Format_pw (Locale), penwidth);
      Primitives.Add (Format_px (Locale), penreverse);
      Primitives.Add (Format_quotient (Locale), quotient);
      Primitives.Add (Format_ran (Locale), random);
      Primitives.Add (Format_random (Locale), random);
      Primitives.Add (Format_read (Locale), read);
      Primitives.Add (Format_readchar (Locale), readcharacter);
      Primitives.Add (Format_readcharacter (Locale), readcharacter);
      Primitives.Add (Format_readcharflow (Locale), readcharflow);
      Primitives.Add (Format_readlineflow (Locale), readlineflow);
      Primitives.Add (Format_readmouse (Locale), readmouse);
      Primitives.Add (Format_red (Locale), red);
      Primitives.Add (Format_refresh (Locale), refresh);
      Primitives.Add (Format_remove (Locale), remove);
      Primitives.Add (Format_repaint (Locale), refresh);
      Primitives.Add (Format_repcount (Locale), repcount);
      Primitives.Add (Format_repeat (Locale), repeat);
      Primitives.Add (Format_replace (Locale), replace);
      Primitives.Add (Format_resetall (Locale), resetall);
      Primitives.Add (Format_reverse (Locale), reverse_k);
      Primitives.Add (Format_right (Locale), right);
      Primitives.Add (Format_rnd (Locale), round);
      Primitives.Add (Format_round (Locale), round);
      Primitives.Add (Format_rt (Locale), right);
      Primitives.Add (Format_run (Locale), run);
      Primitives.Add (Format_save (Locale), save);
      Primitives.Add (Format_saved (Locale), saved);
      Primitives.Add (Format_sc (Locale), screencolor);
      Primitives.Add (Format_screencolor (Locale), screencolor);
      Primitives.Add (Format_screensize (Locale), screensize);
      Primitives.Add (Format_se (Locale), sentence);
      Primitives.Add (Format_sendtcp (Locale), sendtcp);
      Primitives.Add (Format_sentence (Locale), sentence);
      Primitives.Add (Format_sep (Locale), separation);
      Primitives.Add (Format_separation (Locale), separation);
      Primitives.Add (Format_seq (Locale), sequence);
      Primitives.Add (Format_sequence (Locale), sequence);
      Primitives.Add (Format_setdir (Locale), setdirectory);
      Primitives.Add (Format_setdirectory (Locale), setdirectory);
      Primitives.Add (Format_setdq (Locale), setdrawingquality);
      Primitives.Add (Format_setdrawingquality (Locale), setdrawingquality);
      Primitives.Add (Format_setfn (Locale), setfontname);
      Primitives.Add (Format_setfontname (Locale), setfontname);
      Primitives.Add (Format_setfontsize (Locale), setfontsize);
      Primitives.Add (Format_setfs (Locale), setfontsize);
      Primitives.Add (Format_setheading (Locale), setheading);
      Primitives.Add (Format_setindexsequence (Locale), setindexsequence);
      Primitives.Add (Format_setinstrument (Locale), setinstrument);
      Primitives.Add (Format_setitem (Locale), replace);
      Primitives.Add (Format_setpc (Locale), setpencolor);
      Primitives.Add (Format_setpencolor (Locale), setpencolor);
      Primitives.Add (Format_setpenshape (Locale), setpenshape);
      Primitives.Add (Format_setpenwidth (Locale), setpenwidth);
      Primitives.Add (Format_setpos (Locale), setposition);
      Primitives.Add (Format_setposition (Locale), setposition);
      Primitives.Add (Format_setps (Locale), setpenshape);
      Primitives.Add (Format_setpw (Locale), setpenwidth);
      Primitives.Add (Format_setsc (Locale), setscreencolor);
      Primitives.Add (Format_setscreencolor (Locale), setscreencolor);
      Primitives.Add (Format_setscreensize (Locale), setscreensize);
      Primitives.Add (Format_setsep (Locale), setsep);
      Primitives.Add (Format_setseparation (Locale), setseparation);
      Primitives.Add (Format_setshape (Locale), setshape);
      Primitives.Add (Format_setsty (Locale), setstyle);
      Primitives.Add (Format_setstyle (Locale), setstyle);
      Primitives.Add (Format_settc (Locale), settextcolor);
      Primitives.Add (Format_settextcolor (Locale), settextcolor);
      Primitives.Add (Format_settextname (Locale), settextname);
      Primitives.Add (Format_settextsize (Locale), settextsize);
      Primitives.Add (Format_settm (Locale), setturtlesmax);
      Primitives.Add (Format_settn (Locale), settextname);
      Primitives.Add (Format_setts (Locale), settextsize);
      Primitives.Add (Format_setturtle (Locale), setturtle);
      Primitives.Add (Format_setturtlesmax (Locale), setturtlesmax);
      Primitives.Add (Format_setx (Locale), setx);
      Primitives.Add (Format_setxy (Locale), setxy);
      Primitives.Add (Format_sety (Locale), sety);
      Primitives.Add (Format_shape (Locale), shape);
      Primitives.Add (Format_showturtle (Locale), showturtle);
      Primitives.Add (Format_sin (Locale), sin);
      Primitives.Add (Format_sindseq (Locale), setindexsequence);
      Primitives.Add (Format_sine (Locale), sine);
      Primitives.Add (Format_sinstr (Locale), setinstrument);
      Primitives.Add (Format_sqrt (Locale), squareroot);
      Primitives.Add (Format_squareroot (Locale), squareroot);
      Primitives.Add (Format_st (Locale), showturtle);
      Primitives.Add (Format_stop (Locale), stop);
      Primitives.Add (Format_stopall (Locale), stopall);
      Primitives.Add (Format_stopanim (Locale), stopanimation);
      Primitives.Add (Format_stopanimation (Locale), stopanimation);
      Primitives.Add (Format_stopgrid (Locale), stopgrid);
      Primitives.Add (Format_stoptrace (Locale), stoptrace);
      Primitives.Add (Format_sturtle (Locale), setturtle);
      Primitives.Add (Format_sty (Locale), style);
      Primitives.Add (Format_style (Locale), style);
      Primitives.Add (Format_sum (Locale), sum);
      Primitives.Add (Format_tan (Locale), tangent);
      Primitives.Add (Format_tangent (Locale), tangent);
      Primitives.Add (Format_tc (Locale), textcolor);
      Primitives.Add (Format_textcolor (Locale), textcolor);
      Primitives.Add (Format_textname (Locale), textname);
      Primitives.Add (Format_textsize (Locale), textsize);
      Primitives.Add (Format_thing (Locale), thing);
      Primitives.Add (Format_time (Locale), time);
      Primitives.Add (Format_tm (Locale), turtlesmax);
      Primitives.Add (Format_tn (Locale), textname);
      Primitives.Add (Format_towards (Locale), towards);
      Primitives.Add (Format_trace (Locale), trace);
      Primitives.Add (Format_true (Locale), true_k);
      Primitives.Add (Format_ts (Locale), textsize);
      Primitives.Add (Format_turtle (Locale), turtle);
      Primitives.Add (Format_turtles (Locale), turtles);
      Primitives.Add (Format_turtlesmax (Locale), turtlesmax);
      Primitives.Add (Format_unicode (Locale), unicode);
      Primitives.Add (Format_variables (Locale), variables);
      Primitives.Add (Format_vars (Locale), variables);
      Primitives.Add (Format_visible (Locale), visible);
      Primitives.Add (Format_wait (Locale), wait);
      Primitives.Add (Format_wash (Locale), wash);
      Primitives.Add (Format_while (Locale), while_k);
      Primitives.Add (Format_white (Locale), white);
      Primitives.Add (Format_window (Locale), window);
      Primitives.Add (Format_word (Locale), word);
      Primitives.Add (Format_wordp (Locale), wordp);
      Primitives.Add (Format_wrap (Locale), wrap);
      Primitives.Add (Format_write (Locale), write);
      Primitives.Add (Format_writelineflow (Locale), writelineflow);
      Primitives.Add (Format_yellow (Locale), yellow);
      Primitives.Add (Format_zonesize (Locale), zonesize);
      Primitives.Add (Format_zoom (Locale), zoom);
   end Fill;

end Logo.Parser;
