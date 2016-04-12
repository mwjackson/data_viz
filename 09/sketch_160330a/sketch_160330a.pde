//network of coursework to do.
import org.gicentre.utils.network.*;

Table cw;
ParticleViewer pViewer;    // Does the force-direction.

void setup()
{
  size(900,600);
  textAlign(CENTER,CENTER);
  cw = loadTable("cwdata.csv","header,csv");
  //for (i=0; i<cw.getRowCount();i++)
  //{
    //println(cw.getString(i,"parent"),cw.getString(i,"child"));
  //}
  // Create a new particle viewer based on sketch dimensions
  pViewer = new ParticleViewer(this, width, height);
  Node cwnode = new Node(width/2,height/2); //single coursework node
  pViewer.addNode(cwnode);
  for (int i=0; i<cw.getRowCount();i++)
  {
    Node node = new Node(random(0,width), random(0,height));
    pViewer.addNode(node);
    
    Edge edge = new Edge(cwnode,node);
    pViewer.addEdge(edge);
  }
  pViewer.spaceNodes();
}

void draw()
{
  background(255);
  pViewer.draw();
}