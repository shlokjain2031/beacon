import {GoogleGenerativeAI} from "https://cdn.jsdelivr.net/npm/@google/generative-ai/+esm";
import { serve } from "https://deno.land/std@0.180.0/http/server.ts";

const portsToTry = [8080, 8081 ];

async function startServer() {
    for (const port of portsToTry) {
        try {
            await serve(async (req) => {
                // dotenv.config();

                console.log("hello");

                const API_KEY = "AIzaSyDcrVA7mDq4EKZSccbEEEWXaO8SpLjlnog";

                const { essayPrompt } = await req.json()

                let data = {
                  essayScore: `3.0`,
                }

                const genAI = new GoogleGenerativeAI(API_KEY);

                const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash"}, "error");

                async function run() {

                  const result = await model.generateContent(`${ essayPrompt }`);
                  const response = await result.response;

                  console.log(response);

                  const text = response.text();
                  console.log(text);

                  data = {
                    essayScore : `${ text }`
                  };
                }

                run();

                console.log(data);

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

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/essay-prompt' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"essayPrompt":"Functions"}'

*/
