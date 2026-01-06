import delimited "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\vaccination.csv", clear

la var schoolyear "School Year"
la var mmrcoverageestimate "Estimated % Vaccinated"
gen year = substr(schoolyear,1,4)
destring year, replace
la var year "Year (indicating fall of academic year)"
twoway line mmrcoverageestimate year, scheme(s1mono) yline(95, lstyle(p2)) xtick(2011(1)2024)
graph export "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\vaccination1.png", replace

twoway line mmrcoverageestimate year, scheme(s1mono) yline(95, lstyle(p2)) xtick(2011(1)2024) yscale(range(0 .)) ylabel(#5)
graph export "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\vaccination2.png", replace

gen unvaccinated = 100 - mmrcoverageestimate
la var mmrcoverageestimate "Estimated % Unvaccinated"
twoway line unvaccinated year, scheme(s1mono) yline(5, lstyle(p2)) xtick(2011(1)2024) yscale(range(0 .)) ylabel(#5)
graph export "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\vaccination3.png", replace
