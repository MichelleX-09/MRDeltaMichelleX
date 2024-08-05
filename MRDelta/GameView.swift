//
//  GameView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI

struct GameView: View {
    var level: Int
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Game Level \(level)")
                .font(.largeTitle)
                .padding()

            if level == 1 {
                Level0GameView()
            } else if level == 2  {
                // Placeholder for other levels
                //Text("Game content for level \(level) goes here.")
                 //   .padding()
                Level20GameView()
            } else if level == 3 { Level1GameView()
            } else if level == 4 { Level2GameView() }
            else{ Level5GameView()}

            Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Level \(level)")
        .navigationBarHidden(true)
    }
}


struct Level4GameView: View {
    var body: some View {
        Text("Level 3 Game View")
            .padding()
        Text("Platinum Challenge")
            .padding()
            .background(Color.palepink)
            .foregroundColor(.black)
            .cornerRadius(8)


    }
}


struct Level5GameView: View {
    var body: some View {
        Text("Level 5 Game View")
            .padding()
        Text("Gold Challenge")
            .padding()
            .background(Color.palepink)
            .foregroundColor(.black)
            .cornerRadius(8)


        Text("To be added later.")
            .padding()
    }
}


struct Level0GameView: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showAlert = false
    @State private var alertMessage = ""

    let questions = [
        Question(text: "What is the primary cause of the Mississippi Delta crisis?", choices: ["Hurricane damage", "Oil spills", "Climate change and sea level rise", "Deforestation"], correctAnswerIndex: 2),
        Question(text: "Which project aims to restore the wetlands of the Mississippi Delta?", choices: ["Delta Restoration Initiative", "Wetland Revival Project", "Coastal Restoration Partnership", "Mississippi Wetlands Rehabilitation"], correctAnswerIndex: 0),
        Question(text: "What is one of the significant impacts of the Mississippi Delta crisis on wildlife?", choices: ["Increase in biodiversity", "Loss of habitat", "Population boom", "Introduction of new species"], correctAnswerIndex: 1),
        Question(text: "How much land is the Mississippi Delta losing annually due to erosion?", choices: ["10 square miles", "25 square miles", "50 square miles", "75 square miles"], correctAnswerIndex: 2),
        Question(text: "What role do levees play in the Mississippi Delta crisis?", choices: ["Prevent flooding", "Increase water flow", "Trap sediment", "All of the above"], correctAnswerIndex: 0),
        Question(text: "Which organization is heavily involved in the restoration efforts of the Mississippi Delta?", choices: ["Greenpeace", "World Wildlife Fund", "The Nature Conservancy", "Environmental Protection Agency"], correctAnswerIndex: 2),
        Question(text: "What is a major goal of the Coastal Restoration Partnership?", choices: ["Increase urban development", "Restore natural water flow", "Introduce new wildlife species", "Build new levees"], correctAnswerIndex: 1),
        Question(text: "What is one method used to restore the wetlands in the Mississippi Delta?", choices: ["Clear-cutting trees", "Controlled burns", "Sediment diversion", "Draining swamps"], correctAnswerIndex: 2),
        Question(text: "Why is sediment important for the health of the Mississippi Delta?", choices: ["It blocks water flow", "It provides nutrients for plant growth", "It is used for construction", "It decreases water pollution"], correctAnswerIndex: 1),
        Question(text: "Which species is directly affected by the loss of wetlands in the Mississippi Delta?", choices: ["Grizzly bears", "Manatees", "Alligators", "Bald eagles"], correctAnswerIndex: 2),
        Question(text: "What percentage of North America's migratory waterfowl use the Mississippi Delta as a stopover?", choices: ["10%", "20%", "40%", "70%"], correctAnswerIndex: 3),
        Question(text: "What is the impact of saltwater intrusion on the Mississippi Delta?", choices: ["Increased freshwater species", "Improved crop yields", "Decreased plant diversity", "Enhanced soil fertility"], correctAnswerIndex: 2),
        Question(text: "What is the purpose of the Louisiana Coastal Master Plan?", choices: ["Build new cities", "Restore coastal wetlands", "Expand agriculture", "Increase tourism"], correctAnswerIndex: 1),
        Question(text: "Which of the following is a proposed solution to combat land loss in the Mississippi Delta?", choices: ["Dredging", "Sediment diversions", "Building seawalls", "Relocating communities"], correctAnswerIndex: 1),
        Question(text: "How does climate change exacerbate the Mississippi Delta crisis?", choices: ["Decreasing rainfall", "Rising sea levels", "Cooling temperatures", "Increasing freshwater supply"], correctAnswerIndex: 1),
        Question(text: "What is a critical benefit of restoring the Mississippi Delta wetlands?", choices: ["Improved air quality", "Reduced flood risk", "Increased urban sprawl", "Decreased tourism"], correctAnswerIndex: 1),
        Question(text: "Which river's sediment flow is crucial for the Mississippi Delta's health?", choices: ["Missouri River", "Mississippi River", "Colorado River", "Columbia River"], correctAnswerIndex: 1),
        Question(text: "What is the role of marsh creation in the restoration efforts?", choices: ["Increase saltwater intrusion", "Build urban areas", "Provide habitat for wildlife", "Decrease sediment supply"], correctAnswerIndex: 2),
        Question(text: "How does the loss of wetlands affect the fishing industry in the Mississippi Delta?", choices: ["Increases fish populations", "Improves fishing conditions", "Destroys fish habitats", "No impact"], correctAnswerIndex: 2),
        Question(text: "What is the significance of barrier islands in the Mississippi Delta?", choices: ["Prevent erosion", "Support tourism", "Provide fresh water", "Protect against storms"], correctAnswerIndex: 3),
           
    ].shuffled()

    
    var body: some View {
        Text("Bronze Challenge")
            .padding()
            .background(Color.palepink)
            .foregroundColor(.black)
            .cornerRadius(8)


        VStack {
            Text(questions[currentQuestionIndex].text)
                .font(.title)
                .padding()

            ForEach(0..<questions[currentQuestionIndex].choices.count) { index in
                Button(action: {
                    answerQuestion(at: index)
                }) {
                    Text(questions[currentQuestionIndex].choices[index])
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 5)
            }
            
            Spacer()

            Text("Score: \(score)")
                .padding()
            
            if showAlert {
                Text(alertMessage)
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
        }
    }

    func answerQuestion(at index: Int) {
        if questions[currentQuestionIndex].correctAnswerIndex == index {
            score += 1
            alertMessage = "Correct!"
        } else {
            //alertMessage = "Wrong! Correct answer: $questions[currentQuestionIndex].correctAnswerIndex"
            let correctAnswer = questions[currentQuestionIndex].choices[questions[currentQuestionIndex].correctAnswerIndex]
                           alertMessage = "Wrong! Ans: \(correctAnswer)"
        }

        showAlert = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            showAlert = false
            nextQuestion()
        }
    }

    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0
        }
    }
}



// General questions.

struct Level1GameView: View {
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    @State private var showAlert = false
    @State private var alertMessage = ""

    let questions = [
        Question(text: "What is the capital of France?", choices: ["Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 0),
        Question(text: "What is x to make 2x + 5=13?", choices: ["3", "4", "5", "6"], correctAnswerIndex: 1),
        Question(text: "Which planet is known as the Red Planet?", choices: ["Earth", "Mars", "Jupiter", "Saturn"], correctAnswerIndex: 1),
        Question(text: "What is the capital of China?", choices: ["Beijin","Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 0),
        Question(text: "What is 12 + 21?", choices: ["23", "33", "25", "16"], correctAnswerIndex: 1),
        Question(text: "Which planet in solar system has the most moons?", choices: ["Earth", "Mars", "Jupiter", "Saturn", "Venus"], correctAnswerIndex: 3),
        Question(text: "Who wrote 'To Kill a Mockingbird'?", choices: ["Harper Lee", "Mark Twain", "Ernest Hemingway", "F. Scott Fitzgerald"], correctAnswerIndex: 0),
        Question(text: "What is the largest ocean on Earth?", choices: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"], correctAnswerIndex: 3),
        Question(text: "What is the square root of 64?", choices: ["6", "7", "8", "9"], correctAnswerIndex: 2),
        Question(text: "Who painted the Mona Lisa?", choices: ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Claude Monet"], correctAnswerIndex: 2),
        Question(text: "What is the chemical symbol for water?", choices: ["H2O", "CO2", "NaCl", "O2"], correctAnswerIndex: 0),
        Question(text: "What is the smallest prime number?", choices: ["1", "2", "3", "5"], correctAnswerIndex: 1),
        Question(text: "What year did the Titanic sink?", choices: ["1910", "1912", "1914", "1916"], correctAnswerIndex: 1),
        Question(text: "What is the capital of Australia?", choices: ["Sydney", "Melbourne", "Canberra", "Brisbane"], correctAnswerIndex: 2),
        Question(text: "Which planet is known as the Red Planet?", choices: ["Venus", "Mars", "Jupiter", "Saturn"], correctAnswerIndex: 1),
        Question(text: "Who wrote 'To Kill a Mockingbird'?", choices: ["Harper Lee", "Mark Twain", "Ernest Hemingway", "F. Scott Fitzgerald"], correctAnswerIndex: 0),
        Question(text: "What is the hardest natural substance on Earth?", choices: ["Gold", "Iron", "Diamond", "Platinum"], correctAnswerIndex: 2),
        Question(text: "In which year did the Titanic sink?", choices: ["1912", "1905", "1915", "1920"], correctAnswerIndex: 0),
        Question(text: "What is the largest organ in the human body?", choices: ["Heart", "Liver", "Lung", "Skin"], correctAnswerIndex: 3),
        Question(text: "Which element has the chemical symbol 'O'?", choices: ["Oxygen", "Gold", "Osmium", "Oganesson"], correctAnswerIndex: 0),
        Question(text: "Who painted the Mona Lisa?", choices: ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Claude Monet"], correctAnswerIndex: 2),
        Question(text: "What is the smallest prime number?", choices: ["1", "2", "3", "5"], correctAnswerIndex: 1),
        Question(text: "Which country is known as the Land of the Rising Sun?", choices: ["China", "South Korea", "Japan", "Thailand"], correctAnswerIndex: 2),
        Question(text: "What is the largest mammal in the world?", choices: ["Elephant", "Whale Shark", "Blue Whale", "Giraffe"], correctAnswerIndex: 2),
        Question(text: "Who was the first President of the United States?", choices: ["Thomas Jefferson", "John Adams", "George Washington", "James Madison"], correctAnswerIndex: 2),
        Question(text: "What is the main ingredient in guacamole?", choices: ["Tomato", "Onion", "Avocado", "Pepper"], correctAnswerIndex: 2),
        Question(text: "Which ocean is the largest?", choices: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"], correctAnswerIndex: 3),
        Question(text: "What is the chemical formula for water?", choices: ["H2O", "CO2", "O2", "H2SO4"], correctAnswerIndex: 0),
        Question(text: "In which city would you find the Eiffel Tower?", choices: ["London", "Paris", "Rome", "Berlin"], correctAnswerIndex: 1),
        Question(text: "Who is known as the 'Father of Computers'?", choices: ["Alan Turing", "Charles Babbage", "Ada Lovelace", "John von Neumann"], correctAnswerIndex: 1),
        Question(text: "What is the capital of Canada?", choices: ["Toronto", "Vancouver", "Ottawa", "Montreal"], correctAnswerIndex: 2),
        Question(text: "Which planet is closest to the sun?", choices: ["Venus", "Earth", "Mercury", "Mars"], correctAnswerIndex: 2),
        Question(text: "Who wrote 'Pride and Prejudice'?", choices: ["Charlotte Brontë", "Emily Dickinson", "Jane Austen", "Mary Shelley"], correctAnswerIndex: 2),
        Question(text: "What is the name of the largest desert in the world?", choices: ["Gobi Desert", "Sahara Desert", "Kalahari Desert", "Antarctic Desert"], correctAnswerIndex: 3),
        Question(text: "Which element has the atomic number 1?", choices: ["Helium", "Hydrogen", "Oxygen", "Carbon"], correctAnswerIndex: 1),
        Question(text: "What is the tallest mountain in the world?", choices: ["K2", "Kangchenjunga", "Mount Everest", "Lhotse"], correctAnswerIndex: 2),
        Question(text: "What is the main language spoken in Brazil?", choices: ["Spanish", "Portuguese", "French", "English"], correctAnswerIndex: 1),
        Question(text: "Who invented the light bulb?", choices: ["Nikola Tesla", "Thomas Edison", "Alexander Graham Bell", "Michael Faraday"], correctAnswerIndex: 1),
        Question(text: "What is the currency of Japan?", choices: ["Yuan", "Won", "Yen", "Ringgit"], correctAnswerIndex: 2),
        Question(text: "Which planet is known for its rings?", choices: ["Jupiter", "Saturn", "Uranus", "Neptune"], correctAnswerIndex: 1),
        Question(text: "Who was the Greek god of the sea?", choices: ["Zeus", "Hades", "Apollo", "Poseidon"], correctAnswerIndex: 3),
        Question(text: "What is the hardest bone in the human body?", choices: ["Skull", "Femur", "Pelvis", "Tibia"], correctAnswerIndex: 1),
        Question(text: "Which artist is famous for the sculpture 'David'?", choices: ["Leonardo da Vinci", "Michelangelo", "Donatello", "Raphael"], correctAnswerIndex: 1),
        Question(text: "What is the capital of Italy?", choices: ["Florence", "Venice", "Rome", "Milan"], correctAnswerIndex: 2),
        Question(text: "What is the chemical symbol for gold?", choices: ["Ag", "Au", "Pb", "Fe"], correctAnswerIndex: 1),
        Question(text: "Who was the 16th President of the United States?", choices: ["Ulysses S. Grant", "Abraham Lincoln", "Andrew Johnson", "James Buchanan"], correctAnswerIndex: 1),
        Question(text: "Which animal is known as the King of the Jungle?", choices: ["Tiger", "Lion", "Elephant", "Bear"], correctAnswerIndex: 1),
        Question(text: "What is the largest island in the world?", choices: ["Australia", "New Guinea", "Greenland", "Borneo"], correctAnswerIndex: 2),
        Question(text: "Who wrote 'The Catcher in the Rye'?", choices: ["J.D. Salinger", "F. Scott Fitzgerald", "Ernest Hemingway", "John Steinbeck"], correctAnswerIndex: 0),
        Question(text: "What is the capital of Spain?", choices: ["Barcelona", "Madrid", "Seville", "Valencia"], correctAnswerIndex: 1),
        Question(text: "What is the main gas found in the Earth's atmosphere?", choices: ["Oxygen", "Hydrogen", "Carbon Dioxide", "Nitrogen"], correctAnswerIndex: 3),
        Question(text: "Who painted the Sistine Chapel ceiling?", choices: ["Leonardo da Vinci", "Raphael", "Michelangelo", "Botticelli"], correctAnswerIndex: 2),
        Question(text: "What is the name of the process by which plants make their food?", choices: ["Respiration", "Transpiration", "Photosynthesis", "Fermentation"], correctAnswerIndex: 2),
        Question(text: "What is the name of the longest river in the world?", choices: ["Amazon", "Nile", "Yangtze", "Mississippi"], correctAnswerIndex: 1),
        Question(text: "Who is the author of the Harry Potter series?", choices: ["J.K. Rowling", "J.R.R. Tolkien", "George R.R. Martin", "C.S. Lewis"], correctAnswerIndex: 0),
        Question(text: "What is the currency of the United Kingdom?", choices: ["Euro", "Dollar", "Yen", "Pound Sterling"], correctAnswerIndex: 3),
        Question(text: "Which planet is known as the Morning Star?", choices: ["Mars", "Venus", "Mercury", "Jupiter"], correctAnswerIndex: 1),
        Question(text: "What is the chemical symbol for sodium?", choices: ["Na", "S", "K", "Mg"], correctAnswerIndex: 0),
        Question(text: "Who discovered penicillin?", choices: ["Louis Pasteur", "Alexander Fleming", "Robert Koch", "Joseph Lister"], correctAnswerIndex: 1),
        Question(text: "What is the smallest country in the world?", choices: ["Monaco", "San Marino", "Vatican City", "Liechtenstein"], correctAnswerIndex: 2),
        Question(text: "What is the largest organ inside the human body?", choices: ["Heart", "Liver", "Lung", "Skin"], correctAnswerIndex: 1),
        Question(text: "Who was the famous nurse during the Crimean War?", choices: ["Clara Barton", "Dorothea Dix", "Florence Nightingale", "Mary Eliza Mahoney"], correctAnswerIndex: 2),
        Question(text: "What is the capital of India?", choices: ["Mumbai", "New Delhi", "Kolkata", "Chennai"], correctAnswerIndex: 1),
        Question(text: "Which famous scientist developed the theory of relativity?", choices: ["Isaac Newton", "Albert Einstein", "Galileo Galilei", "Nikola Tesla"], correctAnswerIndex: 1),
        Question(text: "What is the chemical symbol for silver?", choices: ["Ag", "Au", "Pb", "Fe"], correctAnswerIndex: 0),
        Question(text: "Who wrote '1984'?", choices: ["Aldous Huxley", "George Orwell", "Ray Bradbury", "Philip K. Dick"], correctAnswerIndex: 1),
        Question(text: "What is the currency of South Korea?", choices: ["Yuan", "Won", "Ringgit", "Baht"], correctAnswerIndex: 1),
        Question(text: "Which planet is known as the Giant Red Spot?", choices: ["Earth", "Saturn", "Jupiter", "Neptune"], correctAnswerIndex: 2),
        Question(text: "Who was the famous artist known for his 'Starry Night' painting?", choices: ["Claude Monet", "Vincent van Gogh", "Paul Cézanne", "Henri Matisse"], correctAnswerIndex: 1),
        Question(text: "What is the chemical symbol for iron?", choices: ["Fe", "Ir", "I", "In"], correctAnswerIndex: 0),
        Question(text: "What is the capital city of Brazil?", choices: ["São Paulo", "Rio de Janeiro", "Brasília", "Salvador"], correctAnswerIndex: 2),
        Question(text: "Which famous playwright wrote 'Romeo and Juliet'?", choices: ["Christopher Marlowe", "William Shakespeare", "Ben Jonson", "George Bernard Shaw"], correctAnswerIndex: 1),
        Question(text: "What is the largest land animal?", choices: ["Elephant", "Rhinoceros", "Hippopotamus", "Giraffe"], correctAnswerIndex: 0),
        Question(text: "What is the chemical formula for table salt?", choices: ["NaCl", "KCl", "NaBr", "KBr"], correctAnswerIndex: 0),
        Question(text: "Who discovered the laws of motion and universal gravitation?", choices: ["Isaac Newton", "Galileo Galilei", "Nicolas Copernicus", "Johannes Kepler"], correctAnswerIndex: 0),
        Question(text: "What is the largest city in the world by population?", choices: ["New York City", "Tokyo", "Shanghai", "Mumbai"], correctAnswerIndex: 1),
        Question(text: "What is the name of the famous wizarding school in 'Harry Potter'?", choices: ["Hogwarts", "Durmstrang", "Beauxbatons", "Ilvermorny"], correctAnswerIndex: 0),
        Question(text: "Who painted 'The Persistence of Memory'?", choices: ["Salvador Dalí", "Pablo Picasso", "Claude Monet", "Jackson Pollock"], correctAnswerIndex: 0),
        Question(text: "What is the capital of Germany?", choices: ["Berlin", "Munich", "Frankfurt", "Hamburg"], correctAnswerIndex: 0),
        Question(text: "Which gas makes up the majority of Earth's atmosphere?", choices: ["Oxygen", "Carbon Dioxide", "Nitrogen", "Argon"], correctAnswerIndex: 2),
        Question(text: "What is the tallest building in the world?", choices: ["Burj Khalifa", "Shanghai Tower", "Abraj Al Bait Clock Tower", "One World Trade Center"], correctAnswerIndex: 0),
        Question(text: "What is the capital of Egypt?", choices: ["Cairo", "Alexandria", "Giza", "Luxor"], correctAnswerIndex: 0),
        Question(text: "Which planet is known for its extreme temperatures?", choices: ["Venus", "Mars", "Uranus", "Mercury"], correctAnswerIndex: 0),
        Question(text: "Who was the first human to journey into outer space?", choices: ["Yuri Gagarin", "Neil Armstrong", "Buzz Aldrin", "John Glenn"], correctAnswerIndex: 0),
        Question(text: "What is the largest species of shark?", choices: ["Great White Shark", "Hammerhead Shark", "Whale Shark", "Tiger Shark"], correctAnswerIndex: 2),
        Question(text: "Which famous author wrote 'The Lord of the Rings'?", choices: ["C.S. Lewis", "J.K. Rowling", "J.R.R. Tolkien", "George R.R. Martin"], correctAnswerIndex: 2),
        Question(text: "What is the chemical symbol for potassium?", choices: ["K", "P", "Pt", "Po"], correctAnswerIndex: 0),
        Question(text: "What is the capital of Mexico?", choices: ["Mexico City", "Guadalajara", "Monterrey", "Cancún"], correctAnswerIndex: 0),
        Question(text: "What is the process by which plants absorb water through their roots?", choices: ["Transpiration", "Photosynthesis", "Osmosis", "Diffusion"], correctAnswerIndex: 2),
        Question(text: "Who was the first woman to win a Nobel Prize?", choices: ["Marie Curie", "Rosalind Franklin", "Ada Lovelace", "Jane Goodall"], correctAnswerIndex: 0),
        Question(text: "What is the capital of Norway?", choices: ["Oslo", "Stockholm", "Copenhagen", "Helsinki"], correctAnswerIndex: 0),
        Question(text: "Who was the famous Italian explorer who sailed to the Americas in 1492?", choices: ["Christopher Columbus", "Ferdinand Magellan", "Marco Polo", "Vasco da Gama"], correctAnswerIndex: 0)
           
    ].shuffled()

    
    var body: some View {
        VStack {
            Text("Platinum Challenge")
                .padding()
                .background(Color.palepink)
                .foregroundColor(.black)
                .cornerRadius(8)

            Text(questions[currentQuestionIndex].text)
                .font(.title)
                .padding()

            ForEach(0..<questions[currentQuestionIndex].choices.count) { index in
                Button(action: {
                    answerQuestion(at: index)
                }) {
                    Text(questions[currentQuestionIndex].choices[index])
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 5)
            }
            
            Spacer()

            Text("Score: \(score)")
                .padding()
            
            if showAlert {
                Text(alertMessage)
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
        }
    }

    func answerQuestion(at index: Int) {
        if questions[currentQuestionIndex].correctAnswerIndex == index {
            score += 1
            alertMessage = "Correct!"
        } else {
            //alertMessage = "Wrong! Correct answer: $questions[currentQuestionIndex].correctAnswerIndex"
            let correctAnswer = questions[currentQuestionIndex].choices[questions[currentQuestionIndex].correctAnswerIndex]
                           alertMessage = "Wrong! Ans: \(correctAnswer)"
        }

        showAlert = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            showAlert = false
            nextQuestion()
        }
    }

    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0
        }
    }
}

struct Question {
    let text: String
    let choices: [String]
    let correctAnswerIndex: Int
}





//Level 2 revised

import SwiftUI
import AVFoundation

struct Level2GameView: View {
    @State private var items: [GameItem] = []
    @State private var score = 0
    @State private var gameTime = 30
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var timer: Timer? = nil
    @State private var audioPlayer: AVAudioPlayer?
    
    let itemImages = ["GApple", "GPeach", "GPear", "GStrawberry", "GCherry"]
    let itemImages2 = ["GCat", "GFlower"]
    
    var body: some View {
        VStack {
            Text("Silver Challenge")
                .padding()
                .background(Color.palepink)
                .foregroundColor(.black)
                .cornerRadius(8)



            Text("Pick Fruits to Score: \(score)")
                .font(.title)
                .padding()
            
            Text("Time Left: \(gameTime)")
                .font(.title)
                .padding()
            
            ZStack {
                ForEach(items) { item in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .position(item.position)
                        .onTapGesture {
                            itemTapped(item)
                        }
                }
            }
            .padding()
            
            Spacer()
            
            if showAlert {
                Text(alertMessage)
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .onAppear(perform: startGame)
        .onDisappear(perform: stopGame)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Game Over"), message: Text("Final Score: \(score)"), dismissButton: .default(Text("OK")))
        }
    }
    
    func startGame() {
        resetGame()
        startTimer()
        generateRandomItems()
    }
    
    func resetGame() {
        score = 0
        gameTime = 30
        items.removeAll()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if gameTime > 0 {
                gameTime -= 1
                if gameTime % 2 == 0 {
                    generateRandomItems()
                }
            } else {
                timer?.invalidate()
                showAlert = true
                alertMessage = "Time's up!"
            }
        }
    }
    
    func stopGame() {
        timer?.invalidate()
    }
    
    func generateRandomItems() {
        items.removeAll()
        let numberOfItems = Int.random(in: 5...10)
        for _ in 0..<numberOfItems {
            let imageSet = Bool.random() ? itemImages : itemImages2
            let item = GameItem(
                id: UUID(),
                imageName: imageSet.randomElement() ?? "circle",
                position: CGPoint(
                    x: CGFloat.random(in: 50...300),
                    y: CGFloat.random(in: 50...600)
                )
            )
            items.append(item)
        }
    }
    
    func itemTapped(_ item: GameItem) {
        if itemImages.contains(item.imageName) {
            score += 1
            playSound(named: "hit_sound")
        } else if itemImages2.contains(item.imageName) {
            score -= 1
            playSound(named: "KungFu")
        }
        items.removeAll { $0.id == item.id }
    }
    
    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Could not play sound \(soundName)")
        }
    }
}

struct GameItem: Identifiable {
    let id: UUID
    let imageName: String
    let position: CGPoint
}

struct Level2GameView_Previews: PreviewProvider {
    static var previews: some View {
        Level2GameView()
    }
}


// Game 4 Hanoi Tower (not functioning)




import SwiftUI
import AVFoundation

struct Level20GameView: View {
    @State private var targetPositions: [CGPoint] = Array(repeating: CGPoint(x: 0, y: 0), count: 5)
    @State private var score = 0
    @State private var timer: Timer? = nil
    @State private var timeLeft = 30
    private let targetSize: CGFloat = 50
    private let itemImages = ["Bug1", "Bug2", "Bug3", "Bug4"]
    @State private var player: AVAudioPlayer?

    var body: some View {
        VStack {
            Text("Palladium Challenge")
                .padding()
                .background(Color.palepink)
                .foregroundColor(.black)
                .cornerRadius(8)
            
            Text("Kill bugs to Score: \(score)")
                .font(.largeTitle)
                .padding()
            
            Text("Time Left: \(timeLeft)")
                .font(.title)
                .padding()

            Spacer()

            ZStack {
                // Background
                Color.white
                    .edgesIgnoringSafeArea(.all)

                // Moving targets
                ForEach(0..<itemImages.count, id: \.self) { index in
                    Image(itemImages[index])
                        .resizable()
                        .frame(width: targetSize, height: targetSize)
                        .position(targetPositions[index])
                        .onTapGesture {
                            score += 1
                            playSound()
                            moveTarget(index: index)
                        }
                }
            }

            Spacer()
        }
        .onAppear {
            initializePositions()
            startGame()
        }
        .onDisappear {
            stopGame()
        }
    }

    func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
                for index in 0..<itemImages.count {
                    moveTarget(index: index)
                }
            } else {
                stopGame()
            }
        }
    }

    func stopGame() {
        timer?.invalidate()
        timer = nil
    }

    func initializePositions() {
        for index in 0..<itemImages.count {
            moveTarget(index: index)
        }
    }

    func moveTarget(index: Int) {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        let x = CGFloat.random(in: targetSize...screenWidth - targetSize)
        let y = CGFloat.random(in: targetSize...screenHeight - targetSize)

        withAnimation(.easeInOut(duration: 0.5)) {
            targetPositions[index] = CGPoint(x: x, y: y)
        }
    }

    func playSound() {
        if let url = Bundle.main.url(forResource: "KungFu", withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

struct Level20GameView_Previews: PreviewProvider {
    static var previews: some View {
        Level20GameView()
    }
}
