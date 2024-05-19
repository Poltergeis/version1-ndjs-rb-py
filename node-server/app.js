import express from "express";
import cors from "cors";
import path from "path";

const corsOptions = {
    origin: '*'
}

const app = express();
app.use(cors(corsOptions));

app.get('/view', function (req, res) {
   return res.sendFile(path.join(process.cwd(), "index.html")) 
});

app.listen(3000, function () {
    console.log("api de node corriendo en el puerto 3000");
})