import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.appName
        loadMessages()
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.dataSource = self
        navigationItem.hidesBackButton = true

    }
    
    func loadMessages (){
        db.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField, descending: false).addSnapshotListener { querySnapShot, error in
            if let e = error {
                print(e)
            }else{
                self.message = []
                if let snapShot = querySnapShot?.documents {
                    for doc in snapShot {
                        let sender = doc.data()[Constants.FStore.senderField] as! String
                        let body = doc.data()[Constants.FStore.bodyField] as! String
                        let newMsg = Message(sender: sender, body: body)
                        self.message.append(newMsg)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(row: self.message.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                        }
                        
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageSender = Auth.auth().currentUser?.email,let messageBody = messageTextfield.text {
            db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField:messageSender,
                Constants.FStore.bodyField:messageBody,
                Constants.FStore.dateField:Date().timeIntervalSince1970
            ]) { error in
                    if let e = error {
                        print(e)
                    }else{
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                        }
                    }
                }
        }
        
    }
    
    @IBAction func signOut(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let e as NSError {
            print(e)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = message[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageText.text = message.body
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBuble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.messageText.textColor = UIColor(named: Constants.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBuble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            cell.messageText.textColor = UIColor(named: Constants.BrandColors.lighBlue)
        }
        return cell
    }
}
