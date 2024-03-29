

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
PVector head;
PVector Lhand;
PVector Rhand;


Kinect kinect;
ArrayList <SkeletonData> bodies;

Orb yeet;

Orb[] Orbs=new Orb[10];

  int score = 0;
int X = 50;
int Y = 50;


void setup()
{
  // size(640, 480);
  fullScreen();
  background(0);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
  head = new PVector(0, 0);
  Lhand = new PVector(0, 0);
  Rhand = new PVector(0, 0);
  yeet = new Orb();
  
  for(int i=0; i<10; i++)
  {
    Orbs[i] = new Orb();
  }
  
  
}

void draw()
{
  background(0);
  yeet.draw();
  // image(kinect.GetImage(), 320, 0, 320, 240);
  // image(kinect.GetDepth(), 320, 240, 320, 240);
  // image(kinect.GetMask(), 0, 240, 320, 240);
  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(bodies.get(i));
    drawPosition(bodies.get(i));
  }

  fill(255, 0, 0);
  ellipse(head.x, head.y, 50, 50);
  fill(3, 255, 76);
  ellipse(Lhand.x, Lhand.y, 50, 50);
  fill(3, 255, 76);
  ellipse(Rhand.x, Rhand.y, 50, 50);


  fill(0, 255, 0);
  ellipse(X, Y, 20, 20);

  float d = dist(head.x, head.y, X, Y);
  X = X + 2;

  //float Dhand = dist(Lhand.x, Lhand.y, X, Y);

  //float D2hand = dist(Rhand.x, Rhand.y, X, Y);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

for(int i=0; i<10; i++)
{
  
Orbs[i].draw();

  float d1 = dist(Orbs[i].X, Orbs[i].Y, head.x, head.y);

  float Dhand = dist(Orbs[i].X, Orbs[i].Y, Lhand.x, Lhand.y);

  float D2hand = dist(Orbs[i].X, Orbs[i].Y, Rhand.x, Rhand.y);


  if (d1<30)
  {
    background(0, 255, 0);
    score = score +1;

    Orbs[i].ResetOrb();
  }
  
    if (Dhand<35)
  {
    background(0, 255, 0);
    score = score +1;
    Orbs[i].ResetOrb();
  }

  if (D2hand<35)
  {
    background(0, 255, 0);
    score = score +1;
    Orbs[i].ResetOrb();
  }

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (X > width)
  {
    X = 0;
  }

  if (d<35)
  {
    background(255, 0, 90);
  }










  text(score, 300, 800);
}

void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width/2, _s.position.y*height/2);
}

void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HEAD, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SPINE, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
    Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
    Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
    Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
    Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(_s.skeletonPositions[_j1].x*width, 
      _s.skeletonPositions[_j1].y*height, 
      _s.skeletonPositions[_j2].x*width, 
      _s.skeletonPositions[_j2].y*height);
  }

  if (_j1 == Kinect.NUI_SKELETON_POSITION_HEAD)
  {
    head.x=_s.skeletonPositions[_j1].x*width;
    head.y=_s.skeletonPositions[_j1].y*height;
  }


  if (_j2 == Kinect.NUI_SKELETON_POSITION_HAND_LEFT)
  {
    Lhand.x=_s.skeletonPositions[_j2].x*width;
    Lhand.y=_s.skeletonPositions[_j2].y*height;
  }

  if (_j2 ==  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT)
  {
    Rhand.x=_s.skeletonPositions[_j2].x*width;
    Rhand.y=_s.skeletonPositions[_j2].y*height;
  }
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}
