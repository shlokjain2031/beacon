/// todo:
/// set the response into db
/// return the response

import {GoogleGenerativeAI} from "https://cdn.jsdelivr.net/npm/@google/generative-ai/+esm";
import { serve } from "https://deno.land/std@0.180.0/http/server.ts";
import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm';

const portsToTry = [8080, 8081 ];

const promptFilePath = 'https://khccogobjdfrvgdgezws.supabase.co/storage/v1/object/public/assets/basic_safety_reach_list_prompt_.txt?t=2024-07-27T07%3A47%3A39.278Z';

async function startServer() {
    for (const port of portsToTry) {
        try {
            await serve(async (req) => {

                const API_KEY = "AIzaSyDcrVA7mDq4EKZSccbEEEWXaO8SpLjlnog";
                const supabaseUrl = "https://khccogobjdfrvgdgezws.supabase.co";
                const supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtoY2NvZ29iamRmcnZnZGdlendzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAzMzczMDgsImV4cCI6MjAzNTkxMzMwOH0.WSQ3G7g2WHFdG4nbh0cQM4it7nPHvnbL6euYp4ywt-A";
                const supabase = createClient(supabaseUrl, supabaseAnonKey, "e");

                console.log(`access token: ${supabase.channel.length}`);

                const { userId } = await req.json();

                console.log(`user id: ${userId}`);

                const promptContext = await fetchTextFromUrl(promptFilePath);

                const portfolioResponse = await supabase
                  .from('portfolios')
                  .select()
                  .eq("user_id", userId);

                const portfolioMap = portfolioResponse.data;
                const portfolio = portfolioMap[0];

                const prompt = promptContext + `\n Board of Education in 10th: ${portfolio["board_of_education_in_tenth"]}
                                                \n Board of Education in 12th: ${portfolio["board_of_education_in_twelfth"]}
                                                \n Grade in 10th: ${portfolio["grade_in_tenth"]}
                                                \n Grade in 12th: ${portfolio["grade_in_twelfth"]}
                                                \n Score in SAT: ${portfolio["score_in_sat"]}
                                                \n Score in ACT: ${portfolio["score_in_act"]}
                                                \n Essay Score: ${portfolio["essay_score"]}
                                                \n Passion Project: ${portfolio["passion_project"]}
                                                \n Sports: ${portfolio["sports"]}
                                                \n Awards: ${portfolio["awards"]}
                                                \n A final note: Be harsh judging the extra-curricular of an applicant and do not be lenient at all`;

                console.log(`prompt: ${prompt}`);

                const genAI = new GoogleGenerativeAI(API_KEY);

                const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash"}, "error");

                const result = await model.generateContent(`${ prompt }`);
                const response = await result.response;

                const text = response.text();
                const data = {
                  safetyReachList : `${ text }`
                };

                console.log(`safetyReachList: ${data.safetyReachList}`);

                await supabase
                  .from('user_univerisites')
                  .insert(
                    {
                      'user_id' : userId,
                      'universities' : data.safetyReachList
                    }
                  );

return new Response(JSON.stringify(data), { headers: { 'Content-Type': 'application/json'} })
            }, { port })
            console.log(`Server listening on port ${port}`);
            break;
        } catch (err) {
            if (err instanceof Deno.errors.AddrInUse) {
                console.error(`Port ${port} is already in use`);
                continue;
            } else {
                throw err;
            }
        }
    }
}

startServer();
// import * as dotenv from 'dotenv';
console.log("Hello from Functions!");

async function fetchTextFromUrl(url: string): Promise<string> {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Network response was not ok: ${response.statusText}`);

    }
    const text = await response.text();

    return text;
  } catch (error) {
    console.error('Error fetching text:', error);
    throw error; // Re-throw the error for handling at a higher level
  }
}


/* To invoke locally:

  supabase functions deploy build-basic-safety-reach-list
  curl -L -X POST 'https://khccogobjdfrvgdgezws.supabase.co/functions/v1/build-basic-safety-reach-list' -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtoY2NvZ29iamRmcnZnZGdlendzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAzMzczMDgsImV4cCI6MjAzNTkxMzMwOH0.WSQ3G7g2WHFdG4nbh0cQM4it7nPHvnbL6euYp4ywt-A' --data '{"userId":"Ra2nHOWOQxQ6Bwf4PY026yFj1qZ2"}'

*/
