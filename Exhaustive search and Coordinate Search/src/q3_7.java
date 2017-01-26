/**
 * Created by Deepak Kumar on 23/01/2017.
 */
public class q3_7 {

    public static void main(String[] args){
        CoordinateSearch cs = new CoordinateSearch();
        cs.completePolling();
        cs.opportunisticPolling();
        cs.dynamicPolling();
        FuncEval[] comMinData = cs.comPollMinData;

        System.out.println("Complete Polling results.....");
        for(int i=0;i<comMinData.length;i++){
            System.out.println(comMinData[i].point.x +"," + comMinData[i].point.y + "," + comMinData[i].functionValue);
        }

        System.out.println("\nOpportunistic polling results.....");
        FuncEval[] oppMinData = cs.oppPollMinData;
        for(int i=0;i<oppMinData.length;i++){
            System.out.println(oppMinData[i].point.x + "," + oppMinData[i].point.y + "," + oppMinData[i].functionValue);
        }

        System.out.println("\nDynamic polling results.....");
        FuncEval[] dynMinData = cs.DynPollMinData;
        for(int i=0;i<dynMinData.length;i++){
            System.out.println(dynMinData[i].point.x + "," + dynMinData[i].point.y + "," + dynMinData[i].functionValue);
        }
    }
}
