# Repit

**Repit** is a simple workout logging app built with SwiftUI. It allows users to create workout sessions, log exercises with sets, reps, and weights, and track their progress over time.

## Key Features

- Create and edit **workout sessions** by date.
- Add multiple **exercises** to each session with customizable sets.
- Track **reps and weights** for every set in each exercise.
- View all sessions in a grouped list by date.
- Swipe to delete workouts or sessions.

## Challenges Faced

- **Dynamic list management**: Ensuring smooth add/edit/delete interactions within nested ForEach views.
- **Conditional rendering**: Managing when to show or hide session headers based on exercise count.
- **State synchronization**: Making sure session and workout edits update live without bugs.
- **Performance**: Encountered SwiftUI compiler performance limits when views became too complex.

## Future Additions

- UI improvements for a more intuitive and modern design.
- Exercise images for visual reference while browsing or logging.
- Streak tracking to encourage consistency.
- Goals and progress tracking for motivation.
- Browsable workout library categorized by muscle group or difficulty level.
- Uniqueness: Explore features that set Repit apart from existing apps, such as personalized workout suggestions based on previous logs, adaptive difficulty tracking, AI-based feedback, or social/accountability features like sharing streaks with friends.
