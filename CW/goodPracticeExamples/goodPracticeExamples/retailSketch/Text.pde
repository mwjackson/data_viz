PImage bullet;
String welcomeMessage;
String welcomeTitle;
String welcomeTitle2;
String welcomeMessage2;
String welcomeMessage3;
String welcomeMessage4;
String bullet1;
String bullet2;
String bullet3;
String bullet4;
String bullet5;
String bullet6;
String bullet7;
String iir;

void welcomeText() {
  welcomeTitle = "Welcome";
  welcomeMessage = "Hello, and welcome to Insight into Retail. Here you will learn about the then and now of the Retail sector. This will span across various areas and will present you with opportunities to interact and use this as a learning tool to give you a better understanding of how retail works and where the market stands.";
  welcomeMessage2 = "The main aim of this tool will be to ask various questions, each presented in its own unique way in each tab. Below are questions we plan to answer within this tool.";
  bullet1 = "How can you summarise various retail metrics?";
  bullet2 = "How has the UK grocer market performed and what international opportunities are there?";
  bullet3 = "How have the top 5 retailers performed in the past 40 weeks competitively?";
  bullet4 = "What can we learn from the top brands and suppliers in the UK market?";
  
  welcomeMessage3 = "After spending a good amount of time looking through all the visualisations and analysis covered in this tool, you should have a better understanding of Retail Analytics and the various ways metrics and dimensions can be visualised and the conclusions and deductions that can be made from the final visualisation. You will have the opportunity to interact and truly explore the data how you want.";
  welcomeTitle2 = "How to navigate?";
   welcomeMessage4 = "There are numerous ways in which you can navigate through this tool, these options are described below:";
  bullet5 = "You can use the number keys from 0-4 to navigate each tab (0 for this page)";
  bullet6 = "You can click on whichever tab you wish to see";
  bullet7 = "You can flick through each tab by pressing the TAB key on the keyboard";
  
  iir = "Insight into retail is a different kind of tool that tries provide you with insights using visualisations without having to always look at the number at the back. Nowadays you can get tools that visualise but still cover the dashboards with numbers, this tool is aimed to take you away from that. Although you will still see the usual metrics, these visualisations have been designed to give you an idea of what you're looking at almost instantly. I hope this tool is insightful and helps.";

  
 
  fill(110);
  textFont(body, 14);
  text(welcomeMessage, 45, 115, 570, 200);
  text(welcomeMessage2, 45, 195, 570, 200);

  image(bullet, 65, 245, 15, 15);
  image(bullet, 65, 270, 15, 15);
  image(bullet, 65, 295, 15, 15);
  image(bullet, 65, 320, 15, 15);
  text(bullet1, 90, 247, 570, 200);
  text(bullet2, 90, 272, 570, 200);
  text(bullet3, 90, 297, 570, 200);
  text(bullet4, 90,  322, 570, 200);
  text(welcomeMessage3, 45, 360, 570, 200);
  
  
  text(welcomeMessage4, 45, 525, 570, 200);
  image(bullet, 65, 575, 15, 15);
  image(bullet, 65, 600, 15, 15);
  image(bullet,65, 625, 15, 15);
  text(bullet5, 90, 577, 570, 200);
  text(bullet6, 90, 602, 570, 200);
  text(bullet7, 90, 627, 570, 200);
  
  text(iir, 675, 115, 575, 200);
  
}

