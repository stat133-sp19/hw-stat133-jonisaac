workout01-Jonathan-Isaac
================

*The Golden State Warriors and Shooting Accuracy*

The Golden State Warriors have built a reputation, even more so than other NBA teams, of how accurate their shooting is. This raises the question, "How accurate are the Warriors, really?" . Below is pictured charts of the starting players shots over the 2016 season.

<img src="../images/shot-charts.png" width="90%" style="display: block; margin: auto;" />

As you can see from these charts, The Golden State Warriors starting players have a predilection toward the outside shot, especially the 3 pointer. As anyone who will have played pickup basketball in a park in California will tell you, these players, and especially Stephen Curry, have popularized the playstyle centering on the outside shot. Conventional basketball wisdom tells us that this playstyle is a highly risky game plan and is ill advised, however, the Warriors have taken this high risk/reward game play to the finals multiple times. This is what prompts us to look to the numbers to see if the conventional wisdom is simply wrong, and if the exciting drive to the rim playstyle is just a thing which older or more traditional hoopheads (like me) will mourn the loss of.

**tables**

    # A tibble: 5 x 4
      player         total  made perc_made
      <chr>          <int> <int>     <dbl>
    1 Andre Iguodala   210   134      63.8
    2 Kevin Durant     643   390      60.7
    3 Stephen Curry    563   304      54.0
    4 Klay Thompson    640   329      51.4
    5 Draymond Green   346   171      49.4

    # A tibble: 5 x 4
      player         total  made perc_made
      <chr>          <int> <int>     <dbl>
    1 Klay Thompson    580   246      42.4
    2 Stephen Curry    687   280      40.8
    3 Kevin Durant     272   105      38.6
    4 Andre Iguodala   161    58      36.0
    5 Draymond Green   232    74      31.9

    # A tibble: 5 x 4
      player         total  made perc_made
      <chr>          <int> <int>     <dbl>
    1 Kevin Durant     915   748      81.7
    2 Draymond Green   578   420      72.7
    3 Klay Thompson   1220   886      72.6
    4 Andre Iguodala   371   268      72.2
    5 Stephen Curry   1250   843      67.4

When it comes down to the numbers, one can clearly see that in terms of **accuracy**, the conventional wisdom hold. Kevin durant for instance takes far more 2 point shots than 3 point shots, and is the most accurate shooter of the starting 5. However, it remains to be seen if the playstyle can still be justified by the increased reward for hitting a 3 pointer. in the next table, value will be determined by the amount of points each player brings in for the team. Here, the amount of points scored per possesion is the satistic of interest, since rebounding is a solid part of most NBA level teams. This means that attempting a shot and missing most often costs the offensive team possesion of the ball, and therefore the cost of a high risk shot might be outweighed by this loss of possesion.

    # A tibble: 5 x 4
      player         total_points_attempted total_scored points_per_possesion
      <chr>                           <dbl>        <dbl>                <dbl>
    1 Kevin Durant                     2102         1095                1.20 
    2 Andre Iguodala                    903          442                1.19 
    3 Stephen Curry                    3187         1448                1.16 
    4 Klay Thompson                    3020         1396                1.14 
    5 Draymond Green                   1388          564                0.976

And here we can see that Kevin Durant and Andre Iguodala, two players who attempt 2 pointers more often than 3 pointers, are likely to produce the most point value for a given set of possesions.
