import java.util.ArrayList;

/**
 * Created by Deepak Kumar on 23/01/2017.
 */
public class CoordinateSearch {

    public int numiter;
    public Point2D initPoint; // = new Point2D();
    public double delta;
    public ArrayList<FuncEval> comPollData = new ArrayList<>();
    public ArrayList<FuncEval> oppPollData = new ArrayList<>();
    public ArrayList<FuncEval> DynPollData = new ArrayList<>();
    public FuncEval[] comPollMinData;
    public FuncEval[] oppPollMinData;
    public FuncEval[] DynPollMinData;

    public CoordinateSearch(int iterations, Point2D initialPoint,double delta){
        this.numiter = iterations;
        this.initPoint = initialPoint;
        this.delta = delta;
        InitializeMinArrays();
    }

    public CoordinateSearch(){
        this.numiter = 20;
        this.initPoint = new Point2D(0.0,0.0);
        this.delta = 1;
        InitializeMinArrays();
    }

    private void InitializeMinArrays(){
        this.comPollMinData = new FuncEval[numiter];
        this.oppPollMinData = new FuncEval[numiter];
        this.DynPollMinData = new FuncEval[numiter];
    }

    public FuncEval function3_7Evaluation(Point2D p){
        double val = Math.exp(-p.x)+p.y;
        return new FuncEval(p,val);
    }


    public void completePolling(){
        FuncEval[] fevals = new FuncEval[4];
        Point2D currPoint = initPoint;
        FuncEval prevMin = function3_7Evaluation(initPoint);
        FuncEval newMin = prevMin;
        double del = delta;

        for(int i=0;i<numiter;i++){
            fevals[0] = function3_7Evaluation(new Point2D(currPoint.x + del,currPoint.y)); // e1+x
            fevals[1] = function3_7Evaluation(new Point2D(currPoint.x,currPoint.y + del)); // e2+y
            fevals[2] = function3_7Evaluation(new Point2D(currPoint.x - del,currPoint.y)); // e1-x
            fevals[3] = function3_7Evaluation(new Point2D(currPoint.x,currPoint.y -del)); // e2-y

            for(int j=0;j<4;j++){
                if (fevals[j].functionValue < prevMin.functionValue){
                    newMin = fevals[j];
                }
                comPollData.add(fevals[j]);
            }
            if (newMin.functionValue < prevMin.functionValue){
                currPoint = newMin.point;
            } else{
                del = del/2;
            }
            comPollMinData[i] = newMin;
            prevMin = newMin;
        }
    }


    public void opportunisticPolling(){
        FuncEval feval = function3_7Evaluation(initPoint);
        Point2D currPoint = initPoint;
        FuncEval prevMin = function3_7Evaluation(initPoint);
        FuncEval newMin = prevMin;
        double del = delta;

        for(int i=0;i<numiter;i++){
            for(int j=0;j<4;j++){
                if(j==0){
                    feval = function3_7Evaluation(new Point2D(currPoint.x + del,currPoint.y)); // e1+x
                }
                 if (j==1){
                    feval = function3_7Evaluation(new Point2D(currPoint.x,currPoint.y + del)); // e2+y
                }
                if (j==2){
                    feval = function3_7Evaluation(new Point2D(currPoint.x -del,currPoint.y )); // e1-x
                }
                if(j==3){
                    feval = function3_7Evaluation(new Point2D(currPoint.x, currPoint.y - del)); // e2-y
                }

                oppPollData.add(feval);

                if (feval.functionValue < prevMin.functionValue){
                     newMin = feval;
                    currPoint = newMin.point;
                     break;
                }
            }
            if (newMin.functionValue >= prevMin.functionValue){
                del = del/2;
            }
            oppPollMinData[i] = newMin;
            prevMin = newMin;
        }
    }


    public void dynamicPolling(){
        FuncEval feval = function3_7Evaluation(initPoint);
        Point2D currPoint = initPoint;
        FuncEval prevMin = function3_7Evaluation(initPoint);
        FuncEval newMin = prevMin;
        double del = delta;
        int[] newOrder = {0,1,2,3};  //{+x,+y,-x,-y}

        for (int i=0;i<numiter;i++){
            for(int j=0;j<4;j++){
                int k = newOrder[j];
                if(k==0){
                    feval = function3_7Evaluation(new Point2D(currPoint.x + del,currPoint.y)); // e1+x
                }
                if (k==1){
                    feval = function3_7Evaluation(new Point2D(currPoint.x,currPoint.y + del)); // e2+y
                }
                if (k==2){
                    feval = function3_7Evaluation(new Point2D(currPoint.x -del,currPoint.y )); // e1-x
                }
                if(k==3){
                    feval = function3_7Evaluation(new Point2D(currPoint.x, currPoint.y - del)); // e2-y
                }

                DynPollData.add(feval);

                if(feval.functionValue < prevMin.functionValue){
                    newMin = feval;
                    currPoint = newMin.point;
                    int tmpvar = newOrder[0];
                    newOrder[0] = k;
                    newOrder[j] = tmpvar;
                    break;
                }
            }
            if (newMin.functionValue >= prevMin.functionValue){
                del = del/2;
            }

            DynPollMinData[i]=newMin;
            prevMin = newMin;
        }
    }
}
