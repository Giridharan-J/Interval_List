/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.ginix;

/**
 *
 * @author Giridharan
 */
import java.util.Arrays;
public class Intersection {
    long start,end;
    long milliseconds;
    public long get_time()
    {   
        return(milliseconds);
    }
    public int[] NaiveIsect(int []arr1,int []arr2)
    {   
        int i,j,x=0;
        int []result=new int[1];
        start=System.nanoTime();
        for(i=0;arr1[i]!='\0'&&arr1[i]!=32767;i++)
        {
            for(j=0;arr2[j]!='\0'&&arr2[j]!=32767;j++)
            {
                if(arr1[i]==arr2[j])
                {
                    result=Arrays.copyOf(result,x+1);
                   result[x]=arr1[i];
                    x++;
                    break;
                }
            }
        }
        end=System.nanoTime();
        milliseconds=(end-start)/1000;
        result=Arrays.copyOf(result,x+1);
         result[x]='\0';
        return(result);
    }
    public int[] intIsect(int []arr1,int []arr2,int count)
    {
        int []copy1=new int[200];
        int []copy2=new int[200];
        int []result=new int[200];
        int x=0;
        Arrays.sort(arr1);
        int j=count-1;
        for(int i=0;i<count/2;i++)
        {
            int temp=arr1[i];
            arr1[i]=arr1[j];
            arr1[j]=temp;
            j--;
        }
        Arrays.sort(arr2);
        j=0;
        int i=0;
        while(arr2[j]!='\0')
        {
            int l=arr1[i];
            int u=arr2[j];
            if(l<=u)
            {
                result=Arrays.copyOf(result,x+1);
                   result[x]=l;
                    x++;
                result=Arrays.copyOf(result,x+1);
                   result[x]=u;
                    x++;
            }
            for(int k=j;arr2[k]!='\0';k++)
            {
                arr2[k]=arr2[k+1];
            }
            j++;
            int p;
            for(p=0;copy2[p]!=u;p++);
            int z=copy1[p];
            int y;
            for(y=0;arr1[y]!=z;y++);
            for(int k=y;arr1[k]!='\0';k++)
            {
                arr1[k]=arr1[k+1];
            }
        }
        result=Arrays.copyOf(result,x+1);
         result[x]='\0';
        return(result);
    }
    
}
