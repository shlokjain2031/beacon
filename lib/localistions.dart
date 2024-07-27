class BeaconLocalistions {

  // todo: get prompt from a .txt file
  String get essayPrompt => "I want you to judge a common app essay based on the prompt on a scale of 1 to 5 where 1 is least and 5 is best. You can rate in spaces of 0.5 that means you can rate an essay as 2 or 2.5 or 3.5 but not as 2.2\n"
      "I want you to look at the following parameters and judge the essay based on only these. Rate the essay on these parameters on a scale of 1 to 5 and the final rating should be an average of all these parameters. The final rating should be in between 1 to 5\n"
      "The parameters are: - went into detail about their experiences \n - used writing techniques to SHOW and not TELL, for example not using (working in a lab) but (spraying a thin platinum film over pieces of copper) \n"
      "- all the paragraphs and experiences should be related to one common guiding thread through out \n - tells how their experiences will form future actions \n - initial attention grabbing sentence or paragraph \n"
      "- use of a good precise language which also feels creative, for example use of clear verbs, figures of speeches and so on \n - there should be a straight forward chronology \n - shows where it all started \n "
      "- not too many sentences in a paragraph, limit to 5-6 maximum \n - the essay starts with tension or an event and then fills the details later \n - no grammatical error, use of transition words and clear flow \n"
      "- word choices and originality \n"
      "- how well have they connected their essay to their achievements \n"
      "All these parameters have a fairly equal weightage, you can tweak these a bit as per the essay. Be unbiased with your rating. \n"
      "You have to output ONLY the final rating and nothing else. Just a number \n"
      "Here is the essay you have to judge based on the prompt \n"
      "Prompt: Write a nearly 650-worded letter on a topic of your choice";
}