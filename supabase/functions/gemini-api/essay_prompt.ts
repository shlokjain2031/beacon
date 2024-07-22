import {GoogleGenerativeAI} from "https://cdn.jsdelivr.net/npm/@google/generative-ai/+esm";
import * as dotenv from 'dotenv';

console.log("Hello from Functions!");

// deno-lint-ignore no-var
declare var process : {
  env: {
    GEMINI_API_KEY: "AIzaSyDcrVA7mDq4EKZSccbEEEWXaO8SpLjlnog",
  }
}

Deno.serve( (req) => {

  dotenv.config();

  console.log("hello");

  // todo: fetch your API_KEY from env file
  const API_KEY = process.env.GEMINI_API_KEY;

  const genAI = new GoogleGenerativeAI(API_KEY);

  const model = genAI.getGenerativeModel({ model: "tunedModels/essay-prompt-7l51aeaejex0"}, "error");

  let data = "";

  async function run() {

    const { essayPrompt } = await req.json()

    const result = await model.generateContent(essayPrompt);
    const response = await result.response;

    console.log(response);

    const text = response.text();
    console.log(text);

    data = text;
  }

  run();

  // todo: write the return as a string
  return new Response(data, { headers: { 'Content-Type': 'application/json'} })
})


/* To invoke locally:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/gemini-api' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"essayPrompt":"Hello Bro"}'

*/
