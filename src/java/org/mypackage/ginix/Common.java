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
public class Common {
    public int[] join(int lower[],int upper[],int length)
    {
        int j,k=0;
        int []arr=new int[1];
        for(j=0;j<length;j++)
       {
    if(lower[j]!=-1)
               {
            //arr[k]=lower[j];
                   arr=Arrays.copyOf(arr,k+1);
                   arr[k]=lower[j];
             k++;
               }
    if(upper[j]!=-1)
               {
            arr=Arrays.copyOf(arr,k+1);
                   arr[k]=upper[j];
             k++;
               }
         }
       arr=Arrays.copyOf(arr,k+1);
       arr[k]='\0';
       return arr;
    }
    public int[] convert(int []result)
    {
        int i,j,x,index=0;
        int []finres=new int[1];
        for(i=0;result[i]!='\0';i+=2)
         {
           j=result[i];x=result[i+1];
           for(;j<=x;j++)
               {
                   finres=Arrays.copyOf(finres,index+1);
                     finres[index]=j;
                     index++;
               }
    
        }
        finres=Arrays.copyOf(finres,index+1);
       finres[index]='\0';
       return(finres);
    }
    
    public int[] remdup(int []finres)
    {
        int i,current,index;
        for(index=0;finres[index]!='\0';index++);
        for(i=0;i<index;i++)
        {
         current=finres[i];
         if(current==-1)
         {
                 continue;
         }
         for(int j=i+1;j<index;j++)
               {
                 if(finres[j]==current)
                       {
                         finres[j]=-1;
                       }
               }
       
        }

        int count=0;
        int []finalarr=new int[20];
        for(i=0;i<index;i++)
            {
             if(finres[i]==-1)
             {
                 continue;
             }
             else
                 {
                 finalarr[count]=finres[i];
                 count++;
                 }
            }
        finalarr[count]='\0';
        count++;
        return(finalarr);
    }  
    public int[] splitinteger(String str)
    {
        int []temp=new int[1];
        char[] chars = str.toCharArray();
        int i=0,count=0;
        int len=str.length();
        chars=Arrays.copyOf(chars,len+1);
        chars[len]='\0';
        while(chars[i]!='\0')
        {
            if(chars[i]==',')
            {
                int j=i+1;
                while(chars[j]!=','&& chars[j]!='\0')
                {
                    j++;
                }
            String tmp=str.substring(i+1,j);
            int ind=Integer.parseInt(tmp);
            temp=Arrays.copyOf(temp,count+1);
            temp[count]=ind;
            count++;
            i=j;
            }
        }
        temp=Arrays.copyOf(temp,count+1);
        temp[count]=32767;
        return(temp);
    }
    public int[] convertinterval(int []arr)
    {
        int i=0,j=0,k,count=0;
        k=j+1;
        int []temp=new int[1];
        if(arr[k]==32767)
        {
           temp=Arrays.copyOf(temp,count+1);
            temp[count]=arr[i];
            count++;
            temp=Arrays.copyOf(temp,count+1);
            temp[count]=arr[i];
            count++; 
        }
        while(arr[k]!=32767)
        {
            k=j+1;
            while(arr[k]==arr[j]+1)
            {
                j++;
                k++;
            }
            temp=Arrays.copyOf(temp,count+1);
            temp[count]=arr[i];
            count++;
            temp=Arrays.copyOf(temp,count+1);
            temp[count]=arr[j];
            count++;
            i=k;
            j=k;
            
            /*if(arr[i+1]!=arr[i]+1)
            {
               temp=Arrays.copyOf(temp,count+1);
            temp[count]=arr[i];
            count++;
            temp=Arrays.copyOf(temp,count+1);
            temp[count]=arr[j];
            count++; 
            i=k;
            j=k;
            k=j+1;
            }*/
        }
        temp=Arrays.copyOf(temp,count+1);
        temp[count]=-1;
        return(temp);
    }
    public String convertstring(int []arr)
    {
        int i=0;
        String resstring=",";
        //resstring=String.valueOf(arr[i]);
        for(i=0;arr[i+1]!=-1;i++)
        {
            resstring=resstring+arr[i]+',';
        }
        resstring=resstring+arr[i];
        return(resstring);
    }
    
        
        
    
}
