import PostgreSQLProvider

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [Row.self, JSON.self, Node.self]

        try setupProviders()
        try setupPreparations()
    }
    
    /// Configure providers
    private func setupProviders() throws {
        try addProvider(FluentProvider.Provider.self)
        try addProvider(PostgreSQLProvider.Provider.self)
    }
    
    /// Add all models that should have their
    /// schemas prepared before the app boots
    private func setupPreparations() throws {
        preparations.append(Post.self)
        preparations.append(Lesson.self)
        preparations.append(Teacher.self)
        preparations.append(Student.self)
        preparations.append(Pivot<Teacher, Lesson>.self)
        preparations.append(Pivot<Student, Lesson>.self)
    }
}
