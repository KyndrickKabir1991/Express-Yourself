import UIKit

class CreativeWritingClasses: NSObject {

    // MARK: Properties 
    var classes: [String] 
    var duration: TimeInterval 
    var syllabus: [String]

    // MARK: Initialization
    init(classes: [String], duration: TimeInterval, syllabus: [String]) {
        self.classes = classes
        self.duration = duration
        self.syllabus = syllabus
    }

    // MARK: Methods
    
    //1
    func enrollInClass(className: String) {
        guard classes.contains(className) else {
            print("Class \(className) does not exist.")
            return
        }
        print("You've been enrolled in \(className).")
    }
    
    //2
    func getSyllabus() {
        for topic in syllabus {
            print("- \(topic)")
        }
    }

    //3
    func getClassDuration() -> TimeInterval {
        return duration
    }
    
    //4
    func listAvailableClasses() {
        print("The following classes are available:")
        for className in classes {
            print("- \(className)")
        }
    }
    
    //5
    func getClassName(index: Int) -> String? {
        guard index >= 0 && index < classes.count else {
            return nil
        }
        return classes[index]
    }
    
    //6
    func removeClass(className: String) {
        guard let index = classes.firstIndex(of: className) else {
            return
        }
        classes.remove(at: index)
    }
    
    //7
    func addClass(className: String) {
        guard !classes.contains(className) else {
            return
        }
        classes.append(className)
    }
    
    //8
    func updateDuration(newDuration: TimeInterval) {
        duration = newDuration
    }
    
    //9
    func updateSyllabus(newSyllabus: [String]) {
        syllabus = newSyllabus
    }
    
    //10
    func getClassInfo() {
        print("Classes:")
        for className in classes {
            print("- \(className)")
        }
        print("Duration: \(duration)")
        print("Syllabus")
        for topic in syllabus {
            print("- \(topic)")
        }
    }

}