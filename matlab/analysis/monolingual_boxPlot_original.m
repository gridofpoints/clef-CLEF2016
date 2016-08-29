set_colors; 

ah_mono_bg_2005 = mean(AH_MONO_BG_CLEF2005_AP{:,:});
ah_mono_bg_2006 = mean(AH_MONO_BG_CLEF2006_AP{:,:});
ah_mono_bg_2007 = mean(AH_MONO_BG_CLEF2007_AP{:,:});
ah_mono_de_2000 = mean(AH_MONO_DE_CLEF2000_AP{:,:});
ah_mono_de_2001 = mean(AH_MONO_DE_CLEF2001_AP{:,:});
ah_mono_de_2002 = mean(AH_MONO_DE_CLEF2002_AP{:,:});
ah_mono_de_2003 = mean(AH_MONO_DE_CLEF2003_AP{:,:});
ah_mono_es_2001 = mean(AH_MONO_ES_CLEF2001_AP{:,:});
ah_mono_es_2002 = mean(AH_MONO_ES_CLEF2002_AP{:,:});
ah_mono_es_2003 = mean(AH_MONO_ES_CLEF2003_AP{:,:});
ah_mono_fi_2002 = mean(AH_MONO_FI_CLEF2002_AP{:,:});
ah_mono_fi_2003 = mean(AH_MONO_FI_CLEF2003_AP{:,:});
ah_mono_fi_2004 = mean(AH_MONO_FI_CLEF2004_AP{:,:});
ah_mono_fr_2000 = mean(AH_MONO_FR_CLEF2000_AP{:,:});
ah_mono_fr_2001 = mean(AH_MONO_FR_CLEF2001_AP{:,:});
ah_mono_fr_2002 = mean(AH_MONO_FR_CLEF2002_AP{:,:});
ah_mono_fr_2003 = mean(AH_MONO_FR_CLEF2003_AP{:,:});
ah_mono_fr_2004 = mean(AH_MONO_FR_CLEF2004_AP{:,:});
ah_mono_fr_2005 = mean(AH_MONO_FR_CLEF2005_AP{:,:});
ah_mono_fr_2006 = mean(AH_MONO_FR_CLEF2006_AP{:,:});
ah_mono_it_2000 = mean(AH_MONO_IT_CLEF2000_AP{:,:});
ah_mono_it_2001 = mean(AH_MONO_IT_CLEF2001_AP{:,:});
ah_mono_it_2002 = mean(AH_MONO_IT_CLEF2002_AP{:,:});
ah_mono_it_2003 = mean(AH_MONO_IT_CLEF2003_AP{:,:});
ah_mono_pt_2004 = mean(AH_MONO_PT_CLEF2004_AP{:,:});
ah_mono_pt_2005 = mean(AH_MONO_PT_CLEF2005_AP{:,:});
ah_mono_pt_2006 = mean(AH_MONO_PT_CLEF2006_AP{:,:});
ah_mono_hu_2005 = mean(AH_MONO_HU_CLEF2005_AP{:,:});
ah_mono_hu_2006 = mean(AH_MONO_HU_CLEF2006_AP{:,:});
ah_mono_hu_2007 = mean(AH_MONO_HU_CLEF2007_AP{:,:});
ah_mono_sv_2002 = mean(AH_MONO_SV_CLEF2002_AP{:,:});
ah_mono_sv_2003 = mean(AH_MONO_SV_CLEF2003_AP{:,:});




A = [ah_mono_bg_2005 ah_mono_bg_2006 ah_mono_bg_2007 ...
    ah_mono_de_2000 ah_mono_de_2001 ah_mono_de_2002 ah_mono_de_2003 ...
    ah_mono_es_2001 ah_mono_es_2002 ah_mono_es_2003 ...
    ah_mono_fi_2002 ah_mono_fi_2003 ah_mono_fi_2004 ...
    ah_mono_fr_2000 ah_mono_fr_2001 ah_mono_fr_2002 ah_mono_fr_2003 ah_mono_fr_2004 ah_mono_fr_2005 ah_mono_fr_2006 ...
    ah_mono_hu_2005 ah_mono_hu_2006 ah_mono_hu_2007 ...
    ah_mono_it_2000 ah_mono_it_2001 ah_mono_it_2002 ah_mono_it_2003 ...
    ah_mono_pt_2004 ah_mono_pt_2005 ah_mono_pt_2006 ...
    ah_mono_sv_2002 ah_mono_sv_2003 ... 
     ];

 group = [repmat(34, size(ah_mono_bg_2005, 2), 1).' repmat(33, size(ah_mono_bg_2006, 2), 1).' repmat(32, size(ah_mono_bg_2007, 2), 1).' ...
   repmat(31, size(ah_mono_de_2000, 2), 1).' repmat(30, size(ah_mono_de_2001, 2), 1).' repmat(29, size(ah_mono_de_2002, 2), 1).' repmat(28, size(ah_mono_de_2003, 2), 1).' ...
    repmat(27, size(ah_mono_es_2001, 2), 1).' repmat(26, size(ah_mono_es_2002, 2), 1).' repmat(25, size(ah_mono_es_2003, 2), 1).' ...
   repmat(24, size(ah_mono_fi_2002, 2), 1).' repmat(23, size(ah_mono_fi_2003, 2), 1).' repmat(22, size(ah_mono_fi_2004, 2), 1).' ...
   repmat(21, size(ah_mono_fr_2000, 2), 1).' repmat(20, size(ah_mono_fr_2001, 2), 1).' repmat(19, size(ah_mono_fr_2002, 2), 1).' repmat(18, size(ah_mono_fr_2003, 2), 1).' repmat(17, size(ah_mono_fr_2004, 2), 1).' repmat(16, size(ah_mono_fr_2005, 2), 1).' repmat(15, size(ah_mono_fr_2006, 2), 1).' ...
      repmat(14, size(ah_mono_hu_2005, 2), 1).' repmat(13, size(ah_mono_hu_2006, 2), 1).' repmat(12, size(ah_mono_hu_2007, 2), 1).' ...
   repmat(11, size(ah_mono_it_2000, 2), 1).' repmat(10, size(ah_mono_it_2001, 2), 1).' repmat(9, size(ah_mono_it_2002, 2), 1).' repmat(8, size(ah_mono_it_2003, 2), 1).' ...
    repmat(7, size(ah_mono_pt_2004, 2), 1).' repmat(6, size(ah_mono_pt_2005, 2), 1).' repmat(5, size(ah_mono_pt_2006, 2), 1).' ...
   repmat(2, size(ah_mono_sv_2002, 2), 1).' repmat(1, size(ah_mono_sv_2003, 2), 1).'...
     ];

 langs = {'(bg) 2005', '(bg) 2006', '(bg) 2007', ...
        '(de) 2000', '(de) 2001', '(de) 2002', '(de) 2003', ...
        '(es) 2001', '(es) 2002', '(es) 2003', ...
        '(fi) 2002', '(fi) 2003', '(fi) 2004',  ...
        '(fr) 2000', '(fr) 2001', '(fr) 2002', '(fr) 2003', '(fr) 2004', '(fr) 2005', '(fr) 2006', ...
        '(hu) 2005', '(hu) 2006', '(hu) 2007', ...
        '(it) 2000', '(it) 2001', '(it) 2002', '(it) 2003', ...
        '(pt) 2004', '(pt) 2005', '(pt) 2006',  ...
        '(sv) 2002', '(sv) 2003',  ...
        }; 
    
 colors = [color_bg; color_bg; color_bg; ...
color_de; color_de; color_de; color_de; ...
color_es; color_es; color_es; ...
color_fi; color_fi; color_fi; ...
color_fr; color_fr; color_fr; color_fr; color_fr; color_fr; color_fr; ...
color_hu; color_hu; color_hu; ...
color_it; color_it; color_it; color_it; ...
color_pt; color_pt; color_pt; ...
color_sv; color_sv;];

 fHand = figure;
aHand = axes('parent', fHand);
hold(aHand, 'on')
boxplot(A, group.', 'labels', fliplr(langs), 'plotstyle', 'compact', 'colors', flipud(colors), 'boxstyle', 'filled', 'orientation', 'horizontal');
title('CLEF Monolingual Tasks (2000 - 2007) - MAP Distribution (Original data)', 'FontName', 'Helvetica Light', 'FontSize', 14);


xlabel('MAP', 'FontSize', 16);

xlim([0 .65]);

set(aHand, 'XTickLabelRotation', 0, 'YTickLabelRotation', 90, 'FontSize', 18);





